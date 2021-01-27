//
//  shooterScene.swift
//  fgame
//
//  Created by error on 2021/1/11.
//

import UIKit
import SpriteKit

//MARK: category bit mask
enum category:UInt32{
    case player = 1
    case playerBullet = 2
    case enemy = 3
    case ground = 4
}

class shooterScene: SKScene,SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    
    var shootingAnimation:[SKTexture] = []
    
    let tapButton = button()
    
    var playerNode:SKNode? = nil
//    var playerBullet:SKNode? = nil
    
    var rightButtonTap = false
    var leftButtonTap = false
    var fireButtonTap = false
    
    //MARK: did move - init()
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        playerNode = self.childNode(withName: "playerM")!
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "shooterSceneTitle") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        /*set the bit mask**/
        //ground
        let ground = self.childNode(withName: "ground")
        ground?.physicsBody?.categoryBitMask = category.ground.rawValue
        
        //player
        let player = self.childNode(withName: "playerM")
        player?.physicsBody?.collisionBitMask = category.ground.rawValue
        /***/
        
        //create animation to SKTexture
        playerShootingAnimation()
        
        //run enemy, inside func is create enemy
//        runEnemy()
    }
    
    //MARK: did begin
    func didBegin(_ contact: SKPhysicsContact) {
//        let bodya = contact.bodyA.categoryBitMask
//        let bodyb = contact.bodyB.categoryBitMask
//        print("bodyA:\(bodya)")
//        print("bodyb:\(bodyb)")
//        print("category.playerBullet.rawValue:\(category.playerBullet.rawValue)")
        if contact.bodyA.categoryBitMask == category.playerBullet.rawValue{
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
//            print("bullet hit a")
        } else if contact.bodyB.categoryBitMask == category.playerBullet.rawValue{
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
//            print("bullet hit b")
        }
    }
    //MARK: touches 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch:AnyObject in touches{
            let location = touch.location(in: self)
            let touchnode = atPoint(location)
            if touchnode.name == "rightButton"{
                //detect if player xscale is less 0, mean left
                if playerNode!.xScale < 0 {
                    playerNode!.xScale *= -1
                }
                rightButtonTap = true
            }
            if touchnode.name == "leftButton"{
                //detect if player xscale is big 0, mean right
                if playerNode!.xScale > 0 {
                    playerNode!.xScale *= -1
                }
                leftButtonTap = true
            }
            if touchnode.name == "fireButton"{
                tapButton.fireButton(node: playerNode!,animation: shootingAnimation,scene: self)
//                playerBullet = self.childNode(withName: "playerBullet")
                fireButtonTap = true
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch:AnyObject in touches{
            let location = touch.location(in: self)
            let touchnode = atPoint(location)
            
            if touchnode.name == "rightButton"{
                rightButtonTap = false
            }
            if touchnode.name == "leftButton"{
                leftButtonTap = false
            }
            if touchnode.name == "fireButton"{
                fireButtonTap = false
            }
        }
    }
    
    //MARK:Update
    override func update(_ currentTime: TimeInterval) {
        //if left button tap, true, then player move position.x -= 1
        if leftButtonTap {
            tapButton.leftButton(Node: playerNode!)
        }
        
        //if left button tap, true, then player move position.x += 1
        if rightButtonTap {
            tapButton.rightButton(Node: playerNode!)
        }
        
        //if fire button tap, true, then find playerbullet, because it was creating, then intersects, remove. But first bullet will not remove, because time to process code. if hold fire bullet button, then it will.
        if fireButtonTap{
            if let playerBullet = self.childNode(withName: "playerBullet"){
                if !intersects(playerBullet){
                    playerBullet.removeFromParent()
                }
            }
        }
    }
    //MARK:- animation
    func playerShootingAnimation(){
        let shootingAtlas = SKTextureAtlas(named: "playerShootingAnimate")
//        print("playerSHootingAnimate Folder: \(shootingAtlas)")
//        print("count:\(shootingAtlas.textureNames.count)")
        for index in 1...shootingAtlas.textureNames.count{
//            print("index:\(index)")

            let imgName = String(format: "playerM%01d", index)
//            print("image Name:\(imgName)")

            shootingAnimation += [shootingAtlas.textureNamed(imgName)]
//            print("shooting Atlas. names: \(shootingAtlas.textureNames)")
//            print("shooting Atlas. named: \(shootingAtlas.textureNamed(imgName))")
        }
//        print("shootingAnimation:[\(shootingAnimation)]")
    }
    
    //MARK:- create enemy
    func createEnemy() -> SKSpriteNode{
        let enemyNode = SKSpriteNode(imageNamed: "enemy.png")
        enemyNode.name = "enemy"
        enemyNode.size = CGSize(width: 50.0, height: 50.0)
        enemyNode.position = CGPoint(x: -100, y: 0)
        enemyNode.physicsBody = SKPhysicsBody(rectangleOf: enemyNode.frame.size)
        enemyNode.physicsBody?.usesPreciseCollisionDetection = true
        
        enemyNode.physicsBody?.pinned = false
        enemyNode.physicsBody?.affectedByGravity = true
        enemyNode.physicsBody?.allowsRotation = false
        enemyNode.physicsBody?.isDynamic = true
        
        //set enemy able to collision with enemy bullet
//        enemyNode.physicsBody?.categoryBitMask = category.enemy.rawValue
        enemyNode.physicsBody?.collisionBitMask = category.playerBullet.rawValue + category.ground.rawValue
        enemyNode.physicsBody?.contactTestBitMask = category.playerBullet.rawValue
        
        return enemyNode
    }
    
    //MARK:run enemy
    func runEnemy(){
        let enemyAppear = SKAction.sequence([
            SKAction.run {
                let enemyNode = self.createEnemy()
//                let enemyNode = self.childNode(withName: "enemy")
                self.addChild(enemyNode)
            },
            SKAction.wait(forDuration: 2.0)
        ])

        self.run(SKAction.repeat(enemyAppear, count: 10))
    }
}
