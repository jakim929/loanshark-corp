//
//  GameScene.swift
//  LoanShark
//
//  Created by James Kim on 8/11/15.
//  Copyright (c) 2015 James Kim. All rights reserved.
//

import SpriteKit

import Foundation
import SpriteKit

class GameScene : SKScene {
    
    //Very Shitty Coding Practice and breaks MVC rules, but will use until we get an actual UI
    //Referencing viewcontroller is bad

    var contentCreated:Bool = false
    var gameViewController : ViewController!
    var currentGame : GameModel!
    
    var timeOfLastClient : CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
    var timeTillNextClient : CFTimeInterval = CFTimeInterval(Float((arc4random() % 15 + 15)) * TimeScale)
    
    override func didMoveToView(view: SKView) {
        if !contentCreated {
            createSceneContents()
            contentCreated = true
        }
    }
    
    func createSceneContents() {
        backgroundColor = SKColor.yellowColor()
        scaleMode = SKSceneScaleMode.AspectFill
    }
    
    override func update(currentTime: CFTimeInterval) {
        let absoluteTimeNow = CFAbsoluteTimeGetCurrent()
        if currentGame.clientInScene == nil && absoluteTimeNow - timeOfLastClient > timeTillNextClient{
            let client = currentGame.enterClient()
            gameViewController.consoleOutput.text = "A client has entered. \n\n" + client.clientDescription
            
        }
        
        
    }
}
