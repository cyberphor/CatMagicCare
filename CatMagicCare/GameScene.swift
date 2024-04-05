//
//  GameScene.swift
//  CatMagicCare
//
//  Created by Victor on 4/3/24.
//

import SpriteKit

class GameScene: SKScene { // SpriteKitScene
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        //background.size = self.size
        //background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let player = SKSpriteNode(imageNamed: "player")
        //player.position = CGPoint(x: self.size.width, y: self.size.height/5)
        player.zPosition = 2
        self.addChild(player)
    }
}
