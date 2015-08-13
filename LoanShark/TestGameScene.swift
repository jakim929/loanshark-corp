//
//  TestGameScene.swift
//  LoanShark
//
//  Created by James Kim on 8/13/15.
//
//

import Foundation
import SpriteKit

class TestGameScene : SKScene {
   
    var contentCreated:Bool = false
    var gameViewController : GameViewController!
    var currentGame : GameModel!
    
    let person = SKSpriteNode(imageNamed: "person")
    let cubicle = SKSpriteNode(imageNamed: "cubicle")
    let table = SKSpriteNode(imageNamed: "table")
    var totalSquare = SKNode()
    
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
        
        person.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        person.xScale = 0.2
        person.yScale = 0.2
        person.zPosition = 0.2
        
        cubicle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        cubicle.xScale = 0.2
        cubicle.yScale = 0.2
        cubicle.zPosition = 0.1
        
        table.position = CGPoint(x: size.width * 0.5, y: size.height * 0.45)
        table.xScale = 0.2
        table.yScale = 0.2
        table.zPosition = 0.3
        
        totalSquare.addChild(person)
        totalSquare.addChild(cubicle)
        totalSquare.addChild(table)
        
        addChild(totalSquare)
        




    }
    
    override func update(currentTime: CFTimeInterval) {
    }

}
