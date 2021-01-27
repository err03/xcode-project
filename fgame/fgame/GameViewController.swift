//
//  GameViewController.swift
//  fgame
//
//  Created by error on 2021/1/11.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            view.ignoresSiblingOrder = false

            view.showsFPS = true
            view.showsNodeCount = true

            if let scene = SKScene(fileNamed: "GameScene") {
//                scene.size = view.bounds.size
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .resizeFill

                // Present the scene
                view.presentScene(scene)
            }
        }
        
//        let scene = GameScene(size: view.bounds.size)
//        let scene = SKScene(fileNamed: "GameScene")
//        let skView = view as! SKView
//        skView.showsFPS = false
//        skView.showsNodeCount = false
//        skView.ignoresSiblingOrder = false
//        scene!.scaleMode = .resizeFill
//        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
//            return .landscapeLeft
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
