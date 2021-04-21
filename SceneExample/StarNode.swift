//
//  StarNode.swift
//  SceneExample
//
//  Created by David Diego Gomez on 18/04/2021.
//

import SceneKit

class StarNode: SCNNode {
    override init() {
        super.init()
        geometry = SCNPlane(width: 0.05, height: 0.05)
        let image = UIImage(named: "star")
        
        
        geometry?.firstMaterial?.diffuse.contents = image
        geometry?.firstMaterial?.specular.contents = image
        geometry?.firstMaterial?.normal.contents = image
        geometry?.firstMaterial?.emission.contents = image

    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
}
