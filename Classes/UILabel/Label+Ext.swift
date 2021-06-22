//
//  Label+Ext.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/19.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

public extension UILabel {
    
    func setProperty(
        text:String?,
        textColor:UIColor!,
        backgroundColor:UIColor?,
        fontSize:CGFloat,
        alignment:NSTextAlignment?) -> Void {
        
        self.text = text;
        self.textColor = textColor
        self.backgroundColor = backgroundColor ?? .white
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textAlignment = alignment ?? .left
    }
    
}
