//
//  ViewController.swift
//  Lewis_OHerlihy_App
//
//  Created by user164142 on 1/9/20.
//  Copyright © 2020 Lewis O'Herllihy. All rights reserved.
//

import UIKit

protocol viewDelegate {
    func spawnBall()
    func updateAngle(x: Int, y: Int)
    
    
}

class ViewController: UIViewController, viewDelegate {

    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    var angleX = Int()
    var angleY = Int()
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    @IBOutlet weak var BallDelegate: DragImageView!
      
    // var ballArray: [UIImage] = []
    
    func spawnBall() {
        let ballView = UIImageView (image: nil)
        ballView.image = UIImage(named: "ball.png")
        ballView.frame = CGRect(x: 27, y: h*0.5, width: 45, height: 45)
        self.view.addSubview(ballView)
        
        var ballArray: [UIImage] = []
        ballArray.append(UIImage(named: "ball.png")!)
        
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ballView])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: angleX, y: angleY), for: ballView)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        
     //   gravityBehaviour = UIGravityBehavior(items: [ballView])
      //  dynamicAnimator.addBehavior(gravityBehaviour)
        
        collisionBehaviour = UICollisionBehavior(items: [ballView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehaviour)
        dynamicItemBehaviour.addItem(ballView)
        collisionBehaviour.addItem(ballView)
        
       
        collisionBehaviour.addBoundary(withIdentifier: "BackBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: 0, y: w));

        collisionBehaviour.addBoundary(withIdentifier: "TopBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: h, y: 1000100));
            
        collisionBehaviour.addBoundary(withIdentifier: "BottomBoundary" as NSCopying, from: CGPoint(x: 0, y:h ), to: CGPoint(x: 1000, y: w))
        
        
        
    }
    
    func updateAngle(x: Int, y: Int){
        angleX = x*8
        angleY = y*8
        print(angleX)
        print(angleY)
        
    }
    
    func spawnBirds(){
        let bird1 = UIImageView (image: nil)
        let bird2 = UIImageView (image: nil)
        let bird3 = UIImageView (image: nil)
        let bird4 = UIImageView (image: nil)
        
        bird1.image = UIImage(named: "bird1.png")
        bird1.frame = CGRect(x: self.w*0.85, y: self.h*0.035, width: self.w*0.12, height: self.h*0.22)
        
        bird2.image = UIImage(named: "bird2.png")
        bird2.frame = CGRect(x: self.w*0.85, y: self.h*0.3, width: self.w*0.1, height: self.h*0.10)
        
        bird3.image = UIImage(named: "bird3.png")
        bird3.frame = CGRect(x: self.w*0.85, y: self.h*0.525, width: self.w*0.1, height: self.h*0.18)
        
        bird4.image = UIImage(named: "bird4.png")
        bird4.frame = CGRect(x: self.w*0.85, y: self.h*0.75, width: self.w*0.12, height:  self.h*0.12)
        
      // Timer.scheduledTimer9withTimeInterval: 2, repeats: true) {timer in
      //  self.view.addSubviewself.birdArray[Int.random(in: 0...3)])
       // if self.timeCountDown <= 0 {
        //    timer.invalidate()
        //    bird1.removeFromSuperview()
         //   bird2.removeFromSuperview()
         //   bird3.removeFromSuperview()
         //   bird4.removeFromSuperview()
    //    }
        
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BallDelegate.myDelegate = self
        
    }


}

