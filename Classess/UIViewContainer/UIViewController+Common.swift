//
//  UIViewController+Common.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/24.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    static func rootVc()->UINavigationController?{
        let delegate:AppDelegate? = UIApplication.shared.delegate  as? AppDelegate;
        return delegate?.window?.rootViewController as? UINavigationController;
    }
}
