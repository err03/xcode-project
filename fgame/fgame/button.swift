//
//  button.swift
//  fgame
//
//  Created by error on 2021/1/18.
//

import Foundation
import SpriteKit

class button:SKSpriteNode{
    var playerSpeed:CGFloat = 3
    var fireBulletSpeed:CGFloat = 560
    
    var buttonTexture = [SKTexture]()
    
    func rightButton(Node:SKNode){
        Node.position.x += playerSpeed
    }
    
    func leftButton(Node:SKNode){
        Node.position.x -= playerSpeed
    }
    
    func fireButton(node:SKNode,animation:[SKTexture],scene:SKScene){
        let shootingAni = SKAction.animate(with: animation, timePerFrame: 0.05)
        
        let shootingBulletAni = SKAction.run({
            let bulletNode = self.createButtet(scene: scene)    //create bullet at scene
            scene.addChild(bulletNode)
            bulletNode.physicsBody?.applyImpulse(CGVector(dx: node.xScale > 0 ? self.fireBulletSpeed : -self.fireBulletSpeed, dy: 0))
        })
        
        //make SKAction code sequence
        let animateSequence = SKAction.sequence([shootingAni,shootingBulletAni])
        
        node.run(animateSequence)
    }
    
    //MARK:create bullet
    func createButtet(scene:SKScene) -> SKSpriteNode{
        //get player node
        let playerM = scene.childNode(withName: "playerM")
        let playerMPosition = playerM?.position
        let playerMWidth = playerM?.frame.size.width
        
        //create bullet, and define the name, size
        let bullet = SKSpriteNode(imageNamed: "bullet.png")
        bullet.position = CGPoint(x:
                                    playerM!.xScale > 0 ?
                                        playerMPosition!.x + playerMWidth!/2 : //if right
                                        playerMPosition!.x - playerMWidth!/2,  //if left
                                  y: playerMPosition!.y)
        bullet.zPosition = 0
        bullet.name = "playerBullet"
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
        bullet.physicsBody?.usesPreciseCollisionDetection = false
        
        //this "contest bit mask = collisionbitmask" mean, bullet able to every node
//        bullet.physicsBody?.contactTestBitMask = bullet.physicsBody?.collisionBitMask ?? 0
        
        //set bullet physics body to category.playerBullet
        bullet.physicsBody?.categoryBitMask = category.playerBullet.rawValue
        return bullet
    }
}
