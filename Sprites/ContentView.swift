//
//  ContentView.swift
//  Sprites
//
//  Created by William Smith on 7/19/22.
//

import SwiftUI
import SpriteKit

class BoxScene: SKScene{
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        let boxSize = Int.random(in: 20...50)
        let boxColor = UIColor(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: Double.random(in: 0...1))
        let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxSize, height: boxSize))
        
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxSize, height: boxSize))
        box.physicsBody?.restitution = 0.8
        let boing = SKAction.playSoundFileNamed("boing", waitForCompletion: false)
        
        addChild(box)
        run(boing)
        
    }
}

struct ContentView: View {
    var scene: SKScene {
        let scene = BoxScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        return scene
        
    }
    var body: some View {
        SpriteView(scene: scene)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
