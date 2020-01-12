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
    var timerCount = 20
    var score = 0
    
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    
   // var timer = Timer()
    
    @IBOutlet weak var BallDelegate: DragImageView!
    @IBOutlet weak var currentLevel: UILabel!
    @IBOutlet weak var scorecountLabel: UILabel!
    @IBOutlet var currentTimer: UILabel!
    
    var ballArray = [UIImageView]()
    var birdArray = [UIImageView]()
    
    func myTimer() {
        currentTimer.text = "Time: \(timerCount)"
        Timer.scheduledTimer(withTimeInterval: 1.1, repeats: true) { timer in
            self.timerCount -= 1
        }
       
    }
    
    func spawnBall() {
        let ballView = UIImageView (image: nil)
        ballView.image = UIImage(named: "ball.png")
        ballView.frame = CGRect(x: 27, y: h*0.5, width: 45, height: 45)
        self.view.addSubview(ballView)
        
       // var ballArray: [UIImage] = []
        ballArray.append(ballView)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehaviour = UIDynamicItemBehavior(items: ballArray)
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: angleX, y: angleY), for: ballView)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
    
       
        //gravityBehaviour = UIGravityBehavior(items: [ballView])
      //  dynamicAnimator.addBehavior(gravityBehaviour)
        
        collisionBehaviour = UICollisionBehavior(items: ballArray)
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehaviour)
        dynamicItemBehaviour.addItem(ballView)
        collisionBehaviour.addItem(ballView)
        
       
        collisionBehaviour.addBoundary(withIdentifier: "BackBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: 0, y: w));

        collisionBehaviour.addBoundary(withIdentifier: "TopBoundary" as NSCopying, from: CGPoint(x: 0, y:0 ), to: CGPoint(x: h, y: 1000100));
            
        collisionBehaviour.addBoundary(withIdentifier: "BottomBoundary" as NSCopying, from: CGPoint(x: 0, y:h ), to: CGPoint(x: 1000, y: w))
        
       // collisionBehaviour.action = {
         //   for ballView in self.ballArray{
           //     if ballView.frame.intersects(bird1.frame){
                    
             //   }
                
         //   }
    //    }
        
        
        
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
        
        birdArray.append(bird1)
        birdArray.append(bird2)
        birdArray.append(bird3)
        birdArray.append(bird4)
        
   Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {
       timer in self.view.addSubview(self.birdArray[Int.random(in: 0...3)])
        if self.timerCount <= 0 {
         timer.invalidate()
            bird1.removeFromSuperview()
            bird2.removeFromSuperview()
            bird3.removeFromSuperview()
            bird4.removeFromSuperview()
   }
  }
 
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTimer()
        spawnBirds()
        BallDelegate.myDelegate = self
      //  let bird1 = UIImageView (image: nil)
      //  bird1.image = UIImage(named: "bird1.png")
      //  bird1.frame = CGRect(x: self.w*0.85, y: self.h*0.035, width: 100, height: 100)
      //  self.view.addSubview(bird1)
        
        //var Countdown2 =
    }


}


