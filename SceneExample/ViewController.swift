//
//  ViewController.swift
//  SceneExample
//
//  Created by David Diego Gomez on 17/04/2021.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    let pi = CGFloat.pi
    
    @IBOutlet weak var myScene: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addScene()
        addCamera()
        addEarthNode()
        addLight()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func addScene() {
        let scene = SCNScene()
        view.backgroundColor = .black
        myScene.backgroundColor = .black
        myScene.showsStatistics = true
        myScene.allowsCameraControl = true
        myScene.scene = scene
    }
    
    private func addCamera() {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 4)
        myScene.scene?.rootNode.addChildNode(cameraNode)
    }
    
    private func addLight() {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .directional
        lightNode.position = SCNVector3(4, 0, 0)
        myScene.scene?.rootNode.addChildNode(lightNode)
    }
    
    private func addEarthNode() {
        let earthNode = EarthNode()
        myScene.scene?.rootNode.addChildNode(earthNode)
       
        
        addStarNode(node: earthNode,
                    longitude: 0,
                    latitude: 0,
                    radius: 1.0)
        
        addStarNode(node: earthNode,
                    longitude: 5,
                    latitude: 0,
                    radius: 1.0)
        
        addStarNode(node: earthNode,
                    longitude: -9,
                    latitude: 0,
                    radius: 1.0)
        
        addStarNode(node: earthNode,
                    longitude: 9,
                    latitude: 2,
                    radius: 1.0)
        
    }
    
    private func addStarNode(node: SCNNode, longitude: CGFloat, latitude: CGFloat, radius: CGFloat) {
        let star = StarNode()
        node.addChildNode(star)
        
        let Pi = CGFloat.pi
        let longitudeRadian = longitude * Pi / 180
        let latitudeRadian = latitude * Pi / 180
        
        let sin_longitude = sin(longitudeRadian)
        let sin_latitude = sin(latitudeRadian)
        let cos_latitude = cos(latitudeRadian)
        let cos_longitude = cos(longitudeRadian)
    
        let x = radius * sin_longitude * cos_latitude
        let y = radius * sin_longitude * sin_latitude
        let z = radius * cos_longitude
        
        print(x)
        print(y)
        print(z)
    
        star.position = SCNVector3(x, x, z)
       // star.rotation = SCNVector4(x, y, z, latitude)
    }
    
    private func addParticle() {
        
        let particleSystem = SCNParticleSystem()
        particleSystem.birthRate = 50
        particleSystem.birthRateVariation = 10
        particleSystem.particleLifeSpan = 10
        particleSystem.warmupDuration = 1
        particleSystem.loops = true
        particleSystem.birthLocation = .volume
        particleSystem.emitterShape = .none
        particleSystem.birthDirection = .random
        particleSystem.particleColor = .white
        particleSystem.speedFactor = 1.2
        particleSystem.particleSize = 0.05
        particleSystem.particleVelocity = 2.5
        particleSystem.particleMass = 1
        particleSystem.particleBounce = 0.7
        particleSystem.particleFriction = 1
        particleSystem.emissionDuration = 1
        particleSystem.particleImage = UIImage(systemName: "pin.fill")
    
        myScene.scene?.rootNode.addParticleSystem(particleSystem)
    }

}

