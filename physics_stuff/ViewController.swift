//
//  ViewController.swift
//  physics_stuff
//
//  Created by Michelle Venetucci Harvey on 3/23/15.
//  Copyright (c) 2015 thoughtbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        gravity.gravityDirection = CGVectorMake(0, 0.5)
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        collision.addBoundaryWithIdentifier("ground", fromPoint: CGPointMake(0, self.view.frame.height/2), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height))
        collision.addItem(whiteView)
        collision.addItem(blueView)
        
        whiteView.layer.cornerRadius = 50.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressGoButton(sender: AnyObject) {
        gravity.addItem(whiteView)

    }

}

