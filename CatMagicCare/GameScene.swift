//
//  GameScene.swift
//  CatMagicCare
//
//  Created by Victor on 4/3/24.
//

// import the SpriteKit framework
import SpriteKit


// create a new class called "GameScene" based on the "SKScene" class
class GameScene: SpriteKit.SKScene {
    // declare and init a constant called "background" using
    // an instance of the "SKSpriteNode" class and an image from "Assets" called "background"
    let background = SpriteKit.SKSpriteNode(imageNamed: "background")
    
    // declare and init a constant called "player" using
    // an instance of the "SKSpriteNode" class and an image from "Assets" called "player"
    let player = SpriteKit.SKSpriteNode(imageNamed: "player")
    
    // define the "GameScene" class constructor
    // gets ran when an instance of the "GameScene" class has been moved into the app's "SKView" object
    override func didMove(to view: SpriteKit.SKView) {
        // set name of "GameScene" instance
        self.name = "GameScene"
        
        // load background
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        // load player
        player.position = CGPoint(x: background.position.x/2, y: background.position.y/5)
        player.zPosition = 2
        self.addChild(player)
    }
    
    func dropCookie() {
        let cookie = SpriteKit.SKSpriteNode(imageNamed: "cookie")
        cookie.zPosition = 1
        cookie.position = SpriteKit.CGPoint(x: player.position.x, y: player.position.y)
        self.addChild(cookie)
        cookie.run(
            SpriteKit.SKAction.sequence([
                SpriteKit.SKAction.moveTo(y: self.size.height + cookie.size.height, duration: 1),
                SpriteKit.SKAction.removeFromParent()
            ])
        )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dropCookie()
    }
}
