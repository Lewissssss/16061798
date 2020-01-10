//
//  DragImageView.swift
//  Lewis_OHerlihy_App
//
//  Created by user164142 on 1/9/20.
//  Copyright © 2020 Lewis O'Herllihy. All rights reserved.
//

import UIKit

class DragImageView: UIImageView {

    var myDelegate: viewDelegate?
    var startLocation: CGPoint?
    
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        var newCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        let halfx = self.bounds.midX
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min(self.superview!.bounds.width - (w*0.83), newCenter.x)
        
        let halfy = self.bounds.midY
        newCenter.y = max(halfy + (h*0.30), newCenter.y)
        newCenter.y = min(self.superview!.bounds.height - (h*0.37), newCenter.y)
        
        self.center = newCenter
        self.myDelegate?.updateAngle(x: Int(dx), y: Int(dy))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center.x = 27
        self.center.y = h*0.5
        self.myDelegate?.spawnBall()
    }
}
