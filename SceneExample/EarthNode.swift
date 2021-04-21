//
//  EarthNode.swift
//  SceneExample
//
//  Created by David Diego Gomez on 18/04/2021.
//

import SceneKit

class EarthNode: SCNNode {
    override init() {
        super.init()
        geometry = SCNSphere(radius: 1)
        geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Diffuse")
        geometry?.firstMaterial?.specular.contents = UIImage(named: "Specular")
        geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")
        geometry?.firstMaterial?.emission.contents = UIImage(named: "Emission")
        
        geometry?.firstMaterial?.shininess = 10
        let action = SCNAction.rotate(by: 360, around: SCNVector3(x: 0, y: 1, z: 0), duration: 3600 * 2)
        let reapeatAction = SCNAction.repeatForever(action)
        runAction(reapeatAction)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
