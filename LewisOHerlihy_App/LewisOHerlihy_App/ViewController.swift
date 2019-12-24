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
    
    func spawnBall() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var ballObject :UIImageView
        ballObject = UIImageView(frame:CGRect(x: 0, y: 0, width: 45, height: 45));
        ballObject.image = UIImage(named: "ball.png")
        self.view.addSubview(ballObject)
    
       
    }
   
    
    
}


