//
//  UIViewController+Nav.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/22.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private func getNavTitleItem(_ title:String,target:Any?,sel:Selector?,titleColor:UIColor) -> UIBarButtonItem {
        let item = UIBarButtonItem.init(title: title, style: .plain, target: target, action: sel)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14.0)], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14.0)], for: .highlighted)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14.0)], for: .disabled)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14.0)], for: .selected)
        return item;
    }
    func setNavLeftTitle(_ title:String,target:Any?,sel:Selector?,titleColor:UIColor = UIColor.white) -> Void {
        let item = self.getNavTitleItem(title, target: target, sel: sel,titleColor: titleColor)
        self.navigationItem.leftBarButtonItem = item;
    }
    func setNavRightTitle(_ title:String,target:Any?,sel:Selector?,titleColor:UIColor = UIColor.white) -> Void {
        let item = self.getNavTitleItem(title, target: target, sel: sel,titleColor: titleColor)
        self.navigationItem.rightBarButtonItem = item;
    }
    
    private func getNavImageBtn(target:Any,sel:Selector,normalImage:UIImage?,highImage:UIImage?) -> UIButton{
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44));
        btn.setImage(normalImage, for: .normal);
        btn.setImage(highImage, for: .highlighted);
        btn.addTarget(target, action: sel, for: .touchUpInside)
        return btn;
    }
    
    func setNavLeftImage(_ image:UIImage?,target:Any,sel:Selector) -> Void {
        let btn = getNavImageBtn(target: target, sel: sel, normalImage: image, highImage: image);
        btn.contentHorizontalAlignment = .left;
        let btnItem = UIBarButtonItem.init(customView: btn);
        let spacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil); //默认 min=8
        self.navigationItem.leftBarButtonItems = [spacer,btnItem]
    }
    func setNavRightImage(_ image:UIImage?,target:Any,sel:Selector) -> Void {
        let btn = getNavImageBtn(target: target, sel: sel, normalImage: image, highImage: image);
        btn.contentHorizontalAlignment = .right;
        let btnItem = UIBarButtonItem.init(customView: btn);
        let spacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil); //默认 min=8
        self.navigationItem.rightBarButtonItems = [spacer,btnItem]
    }
}

