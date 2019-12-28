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
    
    func spawnBall() {
        // print("hello")
        let ballView = UIImageView(image: nil)
        ballView.image = UIImage(named: "ball.png")
        ballView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        self.view.addSubview(ballView)
        
        
        self.view.bringSubviewToFront(ballView)
        //boulderArray.append(BallObject)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var ballObject :UIImageView
        //ballObject = UIImageView(frame:CGRect(x: 0, y: 0, width: 45, height: 45));
        //ballObject.image = UIImage(named: "ball.png")
        //self.view.addSubview(ballObject)
       // self.view.bringSubviewToFront(ballObject)
        //weak var ballObject: DragImageView!
        //	self.myDelegate
        
        // self.view.bringSubviewToFront(ballView)
       
    }
   
    
    
}

// x: 27, y: H*0.5, width W*0.05, height: 0.1)
