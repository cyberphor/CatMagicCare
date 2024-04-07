//
//  GameViewController.swift
//  CatMagicCare
//
//  Created by Victor on 4/3/24.
//

// import the SpriteKit framework
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // declare and init a constant called "scene" using
        // an instance of our "GameScene" class
        let scene = GameScene(size: CGSize(width: 1170.0, height: 2352.0))
        scene.scaleMode = .aspectFill
        
        // declare and init a constant called "view" using
        // an instance of the "SKView" class
        let view = self.view as! SKView
        view.ignoresSiblingOrder = true
        view.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
