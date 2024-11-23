//
//  CatMagicCare/GameScene.swift
//
//  The purpose of this file is to define the app's core logic, physics, and SpriteKit-related behaviors.
// 

import SpriteKit


// Define a class called "GameScene" based on the "SKScene" class.
class GameScene: SpriteKit.SKScene {
    
    // Init a constant called "background" using an instance of the "SKSpriteNode" class and an image from "Assets" called "background".
    let background = SpriteKit.SKSpriteNode(imageNamed: "background")
    
    // Init a constant called "player" using an instance of the "SKSpriteNode" class and an image from "Assets" called "player."
    let player = SpriteKit.SKSpriteNode(imageNamed: "player")
    
    // Init a constant called "meow" using an instance of the "playSoundFileName" class and a sound called "meow."
    // meow.mp3 creator: https://pixabay.com/users/yoursperfectguy
    let playMeowSound = SpriteKit.SKAction.playSoundFileNamed("meow.mp3", waitForCompletion: false)
    
    // Define the "GameScene" class constructor (it gets executed whenever an instance of the "GameScene" class has been moved into the app's "SKView" object).
    override func didMove(to view: SpriteKit.SKView) {
        
        // Set the name of "GameScene" instance.
        self.name = "GameScene"
              
        // Set the size of the background to be the size of the scene.
        background.size = self.size
        
        // Center the background using the half-way point of the scene's width and height.
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        // Put the background at layer 0 (furthest away from the user).
        background.zPosition = 0
        
        // Attach the background to the scene.
        self.addChild(background)
        
        // Center the player using the half-way point of the scene's width.
        player.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        
        // Put the player two layers in front of the background (so there's a slot between it and the background).
        player.zPosition = 2
        
        // Attach the player to the scene.
        self.addChild(player)
    }
    
    // Define how cookies are dropped.
    func dropCookie() {
        
        // Init a constant called "cookie" using an instance of the "SKSpriteNode" class and an image from "Assets" called "cookie."
        let cookie = SpriteKit.SKSpriteNode(imageNamed: "cookie")

        // Center the cookie using the player's x and y coordinatesn.
        cookie.position = SpriteKit.CGPoint(x: player.position.x, y: player.position.y)
        
        // Put a cookie in a layer that's front of the background, but behind the player.
        cookie.zPosition = 1
        
        // Attach the cookie to the scene.
        self.addChild(cookie)
        
        // Define what to do when the scene’s animation loop is processed.
        cookie.run(
            SpriteKit.SKAction.sequence([
                
                // Play the sound of a cat's meow.
                playMeowSound,
                
                // Move the cookie beyond the top of the scene within 1 second.
                SpriteKit.SKAction.moveTo(y: self.size.height + cookie.size.height, duration: 1),
                
                // Remove the cookie from the scene.
                SpriteKit.SKAction.removeFromParent()
            ])
        )
    }
    
    // Define what to do when the user taps on the screen.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dropCookie()
    }
    
    // Define what to do when the user drags across the screen.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            player.position.x += amountDragged
        }
    }
}
