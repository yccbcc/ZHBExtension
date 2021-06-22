//
//  String+Size.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/15.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension String {

    /**
     NSStringDrawingUsesLineFragmentOrigin = 1 << 0, // 整个文本将以每行组成的矩形为单位计算整个文本的尺寸
     NSStringDrawingUsesFontLeading = 1 << 1,   // 使用字体的行间距来计算文本占用的范围，即每一行的底部到下一行的底部的距离计算
     NSStringDrawingUsesDeviceMetrics = 1 << 3, // 将文字以图像符号计算文本占用范围，而不是以字符计算。也即是以每一个字体所占用的空间来计算文本范围
     NSStringDrawingTruncatesLastVisibleLine // 当文本不能适合的放进指定的边界之内，则自动在最后一行添加省略符号。如果NSStringDrawingUsesLineFragmentOrigin没有设置，则该选项不生效
     */
    
    /**
     *  文字size
     */
    func size(font:UIFont,maxWidth:CGFloat,maxHeight:CGFloat) -> CGSize {
        let maxSize = CGSize.init(width: maxWidth, height: maxHeight)
        let attr:Dictionary<NSAttributedString.Key,Any> = [NSAttributedString.Key.font:font];
        let size = self.boundingRect(with: maxSize, options:[.truncatesLastVisibleLine,.usesLineFragmentOrigin,.usesFontLeading] , attributes: attr, context: nil).size
        return CGSize.init(width: ceil(size.width), height: ceil(size.height))
    }

    /**
     lineBreakMode：设置标签文字过长时的显示方式。
     label.lineBreakMode = NSLineBreakByCharWrapping;//以字符为显示单位显示，后面部分省略不显示。
     label.lineBreakMode = NSLineBreakByClipping; //剪切与文本宽度相同的内容长度，后半部分被删除。
     label.lineBreakMode = NSLineBreakByTruncatingHead; //前面部分文字以……方式省略，显示尾部文字
     label.lineBreakMode = NSLineBreakByTruncatingMiddle;  //中间内容以……方式省略，显示头尾文字
     label.lineBreakMode = NSLineBreakByTruncatingTail;    //结尾内容以……方式省略，显示头文字
     label.lineBreakMode = NSLineBreakByWordWrapping;   //以单词为显示单位显示，后面省略不显示。
     */
    
    /** 文字size linSpace:行间距 */
    func size(font:UIFont,maxWidth:CGFloat,maxHeight:CGFloat,lineSpace:CGFloat) -> CGSize {
        let maxSize = CGSize.init(width: maxWidth, height: maxHeight)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.lineSpacing = lineSpace
        let attr:Dictionary<NSAttributedString.Key,Any> = [NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:paragraphStyle];
        let size = self.boundingRect(with: maxSize, options:[.usesLineFragmentOrigin,.usesFontLeading], attributes: attr, context: nil).size
        return CGSize.init(width: ceil(size.width), height: ceil(size.height))
    }
    

    /** 文字size NSLineBreakMode:文字模式 */
    func size(font:UIFont,maxWidth:CGFloat,maxHeight:CGFloat,lineBreakMode:NSLineBreakMode) -> CGSize {
        let maxSize = CGSize.init(width: maxWidth, height: maxHeight)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineBreakMode = lineBreakMode
        let attr:Dictionary<NSAttributedString.Key,Any> = [NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:paragraphStyle];
        let size = self.boundingRect(with: maxSize, options:[.truncatesLastVisibleLine,.usesFontLeading] , attributes: attr, context: nil).size
        return CGSize.init(width: ceil(size.width), height: ceil(size.height))
    }
    
}
