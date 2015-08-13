//
//  GameViewController.swift
//  LoanShark
//
//  Created by James Kim on 8/11/15.
//
//

import Foundation

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var spriteView:SKView = self.view as! SKView
        spriteView.showsDrawCount = true
        spriteView.showsNodeCount = true
        spriteView.showsFPS = true
        
        /*
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)

        }*/
    }
    
    override func viewWillAppear(animated: Bool) {
        var testGameScene:TestGameScene = TestGameScene(size: CGSizeMake(768, 1024))
        var spriteView:SKView = self.view as! SKView
        spriteView.presentScene(testGameScene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}