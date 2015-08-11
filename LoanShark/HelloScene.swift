//
//  HelloScene.swift
//  LoanShark
//
//  Created by James Kim on 8/11/15.
//
//

import Foundation
import SpriteKit


class HelloScene:SKScene {
    var contentCreated:Bool = false
    
    override func didMoveToView(view: SKView) {
        if !contentCreated {
            createSceneContents()
            contentCreated = true
        }
    }
    
    func createSceneContents() {
        backgroundColor = SKColor.blueColor()
        scaleMode = SKSceneScaleMode.AspectFill
        addChild(newHelloNode())
    }
    
    func newHelloNode() -> SKLabelNode {
        var helloNode:SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
        helloNode.text = "Hello, World!"
        helloNode.fontSize = 42
        helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        helloNode.name = "helloNode"
        return helloNode
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var helloNode:SKNode = childNodeWithName("helloNode")!
        
            helloNode.name = nil
            
            var moveUp:SKAction = SKAction.moveByX(0, y: 100, duration: 0.5)
            var zoom:SKAction = SKAction.scaleTo(2, duration: 0.25)
            var pause:SKAction = SKAction.waitForDuration(0.5)
            var fadeAway = SKAction.fadeOutWithDuration(0.25)
            var remove = SKAction.removeFromParent()
            var moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
            helloNode.runAction(moveSequence)
        

    }
}