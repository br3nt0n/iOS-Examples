//
//  ViewController.swift
//  Pong
//
//  Created by Brenton Currie on 7/09/2015.
//  Copyright (c) 2015 Brenton Currie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var batAI:UIView!
    @IBOutlet var humanAI:UIView!
    @IBOutlet var ball:UIView!
    var dynamicAnimator:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupScene()
    }
    
    func setupScene(){
        let gravity = UIGravityBehavior(items: [ball])
        gravity.magnitude = 20
        gravity.setAngle(90, magnitude: 4)
        
        let collision = UICollisionBehavior(items: [ball, batAI, humanAI])
        collision.translatesReferenceBoundsIntoBoundary = true
      //  collision.addBoundaryWithIdentifier("id", forPath: UIBezierPath(rect: CGRect(x: 0, y: 0, width: 500, height: 100)))
        collision.collisionMode = UICollisionBehaviorMode.Everything
        
        let batAIItemBehaviour = UIDynamicItemBehavior(items: [batAI])
        batAIItemBehaviour.allowsRotation = false
        batAIItemBehaviour.density = 2000
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        dynamicAnimator?.addBehavior(gravity)
        dynamicAnimator?.addBehavior(batAIItemBehaviour)
        dynamicAnimator?.addBehavior(collision)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

