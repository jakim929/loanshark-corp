//
//  Constants.swift
//  LoanShark
//
//  Created by James Kim on 8/10/15.
//
//

import Foundation
import SpriteKit


extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

enum Status : Int {
    case Created
    case Ongoing
    case Paid
    case Defaulted
    case Rejected
}

enum NegStatus : Int {
    case Negotiated
    case Accepted
    case Rejected

}

let TimeScale: Float = 1