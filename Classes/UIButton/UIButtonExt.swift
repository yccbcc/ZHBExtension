//
//  UIButtonExt.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/22.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension UIButton {
    //图片在上 文字在下
    func verticalTopImageAndBottomTitle(spacing:CGFloat) -> Void {
        let imageSize = self.imageView?.frame.size ?? CGSize.zero
        var titleSize = self.titleLabel?.frame.size ?? CGSize.zero
        let textSize = self.titleLabel?.text?.size(font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 10), maxWidth: CGFloat(MAXFLOAT), maxHeight: CGFloat(MAXFLOAT))
        let frameSize = CGSize.init(width: ceil(textSize?.width ?? 0), height: ceil(textSize?.height ?? 0))
        if titleSize.width + 0.5 < frameSize.width {
            titleSize.width = frameSize.width
        }
        let totalHeight = imageSize.height + titleSize.height + spacing
        self.imageEdgeInsets = UIEdgeInsets.init(top: -(totalHeight-imageSize.height), left: 0.0, bottom: 0.0, right: -titleSize.width)
        self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageSize.width, bottom: -(totalHeight-titleSize.height), right: 0)
    }
    
    //文字在上 图片在下
    func verticalTopTitleAndBottomImage(spacing:CGFloat) -> Void {
        let imageSize = self.imageView?.frame.size ?? CGSize.zero
        var titleSize = self.titleLabel?.frame.size ?? CGSize.zero
        let textSize = self.titleLabel?.text?.size(font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 10), maxWidth: CGFloat(MAXFLOAT), maxHeight: CGFloat(MAXFLOAT))
        let frameSize = CGSize.init(width: ceil(textSize?.width ?? 0), height: ceil(textSize?.height ?? 0))
        if titleSize.width + 0.5 < frameSize.width {
            titleSize.width = frameSize.width
        }
        let totalHeight = imageSize.height + titleSize.height + spacing
        self.imageEdgeInsets = UIEdgeInsets.init(top: (totalHeight-imageSize.height), left: 0.0, bottom: 0.0, right: -titleSize.width)
        self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageSize.width, bottom: (totalHeight-titleSize.height), right: 0)
    }
    
    //文字在左 图片在右
    func horizontalLeftTitleAndRightImage(spacing:CGFloat) -> Void {
        let imageSize = self.imageView?.frame.size ?? CGSize.zero
        let titleSize = self.titleLabel?.frame.size ?? CGSize.zero
        self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageSize.width-spacing/2.0, bottom: 0.0, right: imageSize.width + spacing / 2.0)
        self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: titleSize.width+spacing/2.0, bottom: 0.0, right: -titleSize.width-spacing/2.0)
    }
    
    //设置默认状态和选中状态的图片
    func setPropertyOfImage(normalImgName:String, selectedImgName:String) {
        self.setImage(UIImage.init(named: normalImgName), for: .normal)
        self.setImage(UIImage.init(named: selectedImgName), for: .selected)
    }
    func setPropertyOfText(font:UIFont,
                       normalText:String,
                       normalColor:UIColor,
                       selectedText:String? = nil,
                       selectedColor:UIColor? = nil) {
        self.setTitle(normalText, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(normalColor, for: .normal)
        
        if let text = selectedText {
            self.setTitle(text, for: .selected)
        }
        if let color = selectedColor {
            self.setTitleColor(color, for: .selected)
        }
        
    }
    
}
