//
//  ViewController.swift
//  LewisOHerlihy_App
//
//  Created by Lewis O'Herlihy on 12/24/19.
//  Copyright © 2019 Lewis O'Herllihy. All rights reserved.
//

import UIKit



protocol viewDelegate {
    func spawnBall()
   
}

class ViewController: UIViewController, viewDelegate {

    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var dynamicAnimator: UIDynamicAnimator!
    var collisionBehaviour: UICollisionBehavior!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var gravityBehavior: UIGravityBehavior!
    var angleX = Int()
    var angleY = Int()
    

    
    func spawnBall() {
        // print("hello")
        let ballView = UIImageView(image: nil)
        ballView.image = UIImage(named: "ball.png")
        ballView.frame = CGRect(x: 27, y: H*0.5, width: 45, height: 45)
        self.view.addSubview(ballView)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ballView])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x:0, y:300), for: ballView)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
    
       //gravityBehavior = UIGravityBehavior(items: [ballView])
       //dynamicAnimator.addBehavior(gravityBehavior)
        
        collisionBehaviour = UICollisionBehavior(items: [ballView, ballView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehaviour)
        dynamicItemBehaviour.addItem(ballView)
        collisionBehaviour.addItem(ballView)
        
        
        
        dynamicAnimator.addBehavior(collisionBehaviour)
        
        collisionBehaviour.addBoundary(withIdentifier: "BackBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: 0, y: W));

        collisionBehaviour.addBoundary(withIdentifier: "TopBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: H, y: 1000100));
            
        collisionBehaviour.addBoundary(withIdentifier: "BottomBoundary" as NSCopying, from: CGPoint(x: 0, y:H ), to: CGPoint(x: 1000, y: W))
        
    func updateAngle(x: Int, y: Int) {
        angleX = x*8
        angleY = y*8
    }

        //self.view.bringSubviewToFront(ballView)
        
        //boulderArray.append(BallObject)
        
    }

 
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var BallDelegate: DragImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BallDelegate.myDelegate = self
        
         let birdOne = UIImageView(image: nil)
         birdOne.image = UIImage(named: "bird1.png")
         birdOne.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
         self.view.addSubview(birdOne)
        
        // self.view.bringSubviewToFront(ballView)
       
    }
   
    
    
}

// x: 27, y: H*0.5, width W*0.05, height: 0.1)
