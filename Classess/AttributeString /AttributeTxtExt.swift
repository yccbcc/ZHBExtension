//
//  AttributeTxtHeight.swift
//  UIFontHeight
//
//  Created by zhaohongbin on 2019/9/23.
//  Copyright © 2019 zhaohongbin. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    /**
     根据限制宽度，计算富文本的高度
     - parameter width: 限制宽度
     - returns: 富文本高度
     */
    func height(byLimitWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.init(MAXFLOAT))
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height)
    }
    
    /**
     创建一个带行间距的富文本
     - parameter string:       普通字符串
     - parameter font:         类型
     - parameter limitWidth:   字符串限制宽度
     - parameter textColor:    文本颜色，默认黑色
     - parameter lineSpaceing: 行间距， 默认0
     - parameter alignment:    文本对齐，默认左边
     - parameter linebreak:    换行模式，默认以单词区分
     - returns: 富文本
     */
    convenience init(string: String,
                     font: UIFont,
                     limitWidth: CGFloat,
                     textColor: UIColor = UIColor.black,
                     lineSpaceing: CGFloat = 0 ,
                     alignment:NSTextAlignment = .left ,
                     linebreak: NSLineBreakMode = .byWordWrapping) {
        
        // 普通设置
        self.init(string: string)
        let attributes =  [NSAttributedString.Key.font : font,
                           NSAttributedString.Key.foregroundColor: textColor]
        let range =  NSRange(location: 0, length: string.count)
        self.setAttributes(attributes, range: range)
        // 获取自己的高度和一行的高度
        let selfHeight  = self.height(byLimitWidth: limitWidth)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = linebreak
        paragraphStyle.alignment = alignment
        // 当文本不为1行时，增加行边距
        paragraphStyle.lineSpacing =  selfHeight >  2 * font.pointSize ? lineSpaceing : 0
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
    }
}
