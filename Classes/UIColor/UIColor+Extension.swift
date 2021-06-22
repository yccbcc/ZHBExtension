//
//  UIColor+Extension.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/2.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    enum GradientDirection {
        case leftToRight
        case topToBottom
        case leftTopToRightBottom
        case leftBottomToRightTop
    }
    /**
     *  RGB
     */
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat,alpha:CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha:alpha)
    }
    
    /**
     *  RGB
     */
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha:1)
    }
    
    /**
     *  hexColor
     */
    convenience init(hexString: String) {
        self.init(hexString:hexString,alpha:1);
    }
    
    /**
     *  hexColor
     */
    convenience init(hexString: String,alpha:CGFloat) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    /// 渐变色
    /// - Parameters:
    ///   - size: 颜色的尺寸(视图大于size时,着色会重复. 小于size时:展示一部分颜色)
    ///   - direction: 渐变方向
    ///   - firstColor: 颜色1
    ///   - secondColor: 颜色2
    convenience init(size:CGSize,direction:GradientDirection,gradientColor1 firstColor:UIColor,gradientColor1 secondColor:UIColor){
        if __CGSizeEqualToSize(size, CGSize.zero) {
            self.init(white: 1.0, alpha: 1.0)
            return;
        }
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        
        var startPoint = CGPoint.zero;
        var endPoint = CGPoint.zero;
        switch direction {
        case .leftToRight:
            endPoint = CGPoint.init(x: 1.0, y: 0.0)
        case .topToBottom:
            endPoint = CGPoint.init(x: 0.0, y: 1.0)
        case .leftTopToRightBottom:
            endPoint = CGPoint.init(x: 1.0, y: 1.0)
        case .leftBottomToRightTop:
            startPoint = CGPoint.init(x: 0.0, y: 1.0)
            endPoint = CGPoint.init(x: 1.0, y: 0.0)
        }
        gradientLayer.startPoint = startPoint;
        gradientLayer.endPoint = endPoint;
        gradientLayer.colors = [firstColor.cgColor,secondColor.cgColor];
        UIGraphicsBeginImageContext(size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage.init();
        UIGraphicsEndImageContext()
        self.init(patternImage: image) //此方法会导致一定的内存增大(影响不大)
    }
    
    /**
     *  randomColor
     */
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
}
