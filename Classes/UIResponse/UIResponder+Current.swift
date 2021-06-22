//
//  UIResponder+Current.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/8.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

var currentFirstResponder:Any?;

extension UIResponder{
    class func currentFirstResponse() -> Any {
        currentFirstResponder = nil;
        UIApplication.shared.sendAction(#selector(setcurrentFirstResponder), to: nil, from: nil, for: nil);
        return currentFirstResponder as Any;
        
    }
    
    @objc func setcurrentFirstResponder() -> Void {
        currentFirstResponder = self;
    }
}
