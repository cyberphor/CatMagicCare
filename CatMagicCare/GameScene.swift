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
        background.zPosition = 0
        self.addChild(background)
        
        //let player = SKSpriteNode(imageNamed: "player")
        //player.zPosition = 2
        //player.position = CGPoint(x: 0, y: 0)
        //self.addChild(player)
    }
    
    func eatCookie() {
        let cookie = SKSpriteNode(imageNamed: "player")
        cookie.zPosition = 1
        cookie.position = CGPoint(x: 0, y: 0)
        self.addChild(cookie)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        eatCookie()
    }
}
