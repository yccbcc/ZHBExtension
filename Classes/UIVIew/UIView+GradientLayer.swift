//
//  UIView+GradientLayer.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/26.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension UIView{
    func setGradientLayerWithColor(colors:Array<CGColor>) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer.init();
        gradientLayer.locations = [0.0,0.4,0.8,1.0];
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0);
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5);
        gradientLayer.frame = self.layer.frame;
        gradientLayer.colors = colors;
        return gradientLayer;
    }
    
}
