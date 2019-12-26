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
    
    //let W = UIScreen.main.bounds.width
    //let H = UIScreen.main.bounds.height
    
    func spawnBall() {
        // print("hello")
        let BallObject = UIImageView(image: nil)
        BallObject.image = UIImage(named: "ball.png")
        BallObject.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        self.view.addSubview(BallObject)
       //boulderArray.append(BallObject)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var ballObject :UIImageView
        //ballObject = UIImageView(frame:CGRect(x: 0, y: 0, width: 45, height: 45));
        //ballObject.image = UIImage(named: "ball.png")
        //self.view.addSubview(ballObject)
    
        //weak var ballObject: DragImageView!
        self.myDelegate
           
       
    }
   
    
    
}

// x: 27, y: H*0.5, width W*0.05, height: 0.1)
