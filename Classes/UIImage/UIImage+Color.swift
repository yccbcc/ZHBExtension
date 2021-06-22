//
//  UIImage+Color.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/2.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage{
    
    
    static func imageWithColor(color:UIColor) -> UIImage?{
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1);
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: 1.0, height: 1.0), false, 1);
        guard let context = UIGraphicsGetCurrentContext() else { return nil };
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    static func imageWithColor(color:UIColor,size:CGSize) -> UIImage?{
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height);
        UIGraphicsBeginImageContextWithOptions(size, false, 1);
        guard let context = UIGraphicsGetCurrentContext() else { return nil };
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    
}
