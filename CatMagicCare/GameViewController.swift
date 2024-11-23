//
//  CatMagicCare/GameViewController.swift
//
//  The purpose of this file is to define the app's primary UI and present the app's game scenes.
//  It's the bridge between SpriteKit and UIKit.
// 

import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ui = self.view as UIView
        let view = SKView(frame: ui.bounds)
        let scene = GameScene(size: CGSize(width: 1170.0, height: 2352.0))
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        ui.addSubview(view)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}
