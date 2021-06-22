//
//  UIView+Size.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/8.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension UIView {
    public var cy_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newVal) {
            var cy_frame: CGRect = self.frame
            cy_frame.origin.x = newVal
            self.frame = cy_frame
        }
    }
    
    public var cy_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newVal) {
            var cy_frame: CGRect = self.frame
            cy_frame.origin.y = newVal
            self.frame = cy_frame
        }
    }
    
    public var cy_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newVal) {
            var cy_frame: CGRect = self.frame
            cy_frame.size.width = newVal
            self.frame = cy_frame
            
        }
    }
    
    public var cy_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newVal) {
            var cy_frame: CGRect = self.frame
            cy_frame.size.height = newVal
            self.frame = cy_frame
            
        }
        
    }
    
    public var cy_size: CGSize {
        get {
            return self.frame.size
        }
        set(newVal) {
            var cy_frame: CGRect = self.frame
            cy_frame.size = newVal
            self.frame = cy_frame
            
        }
        
    }
    
    public var cy_centerX: CGFloat {
        get {
            return self.center.x
        }
        
        set(newVal) {
            var cy_center: CGPoint = self.center
            cy_center.x = newVal
            self.center = cy_center
        }
        
    }
    
    public var cy_centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newVal) {
            var cy_center: CGPoint = self.center
            cy_center.y = newVal
            self.center = cy_center
        }
        
    }
    
    public var cy_maxX:CGFloat{
        get {
            return self.frame.maxX
        }
    }
    
    public var cy_maxY:CGFloat{
        get {
            return self.frame.maxY
        }
    }
    
    public var cy_minX:CGFloat{
        get {
            return self.frame.minX
        }
    }
    
    public var cy_minY:CGFloat{
        get {
            return self.frame.minX
        }
    }
    
    
    
}
