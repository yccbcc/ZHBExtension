//
//  String+Common.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/9.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit
import Foundation
public extension String {
    
    /// 改变字符串中数字的颜色和字体
        ///
        /// - Parameters:
        ///   - color: 颜色
        ///   - font: 字体
        ///   - regx: 正则 默认数字 "\\d+"
        /// - Returns: attributeString
    func numberChange(color: UIColor,
                      font: UIFont,
                      regx: String = "\\d+") -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        do {
            // 数字正则表达式
            let regexExpression = try NSRegularExpression(pattern: regx, options: NSRegularExpression.Options())
            let result = regexExpression.matches(
                in: self,
                options: NSRegularExpression.MatchingOptions(),
                range: NSMakeRange(0, count)
            )
            for item in result {
                attributeString.setAttributes(
                    [.foregroundColor : color, .font: font],
                    range: item.range
                )
            }
        } catch {
            print("Failed with error: \(error)")
        }
        return attributeString
    }
    
    // 张三显示为。 *三
    func nameReplace() ->String {
        var str = self
        let count = str.count
        var xing = ""
        
        if count < 2 {
            return str
        }
        
        for _ in 0..<count - 1 {
            xing += "*"
        }
        
        return str.replaceString(start: 0, end: count - 1, with: xing)
    }
    
    func idCardReplace() -> String {
        var str = self
        let count = str.count
        var xing = ""
        
        if count < 11 {
            return str
        }
        
        for _ in 0..<count - 5 {
            xing += "*"
        }
        
        return str.replaceString(start: 2, end: count - 2, with: xing)
    }
    
    func replaceString(start:Int,end:Int,with:String) ->String {
        
        var str = self
        let startIndex = str.index(str.startIndex, offsetBy: start)
        let endIndex = str.index(str.startIndex,offsetBy: end)
        
        
        str.replaceSubrange(startIndex..<endIndex, with: with)
        return str
    }
    
    
    //手机号码中间显示137****0568
    func phoneSpeFormart() ->String {
        var str = self.phoneNumerFormat()
        
        let start = str.index(str.startIndex, offsetBy: 4)
        let end = str.index(str.startIndex, offsetBy: 8)
       str.replaceSubrange(start..<end, with: "****")
        return str
    }

    func  IDCardNumberFormat()-> String {
        let strNew = self.replacingOccurrences(of: " ", with: "");
        var strResult = strNew;
        if strNew.count >= 14 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 6));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 15));

        }else if strNew.count >= 6 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 6));
        }
        return strResult;
    }
    
    func phoneNumerFormat() -> String{
        let strNew = self.replacingOccurrences(of: " ", with: "");
        var strResult = strNew;
        if strNew.count >= 7 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 3));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 8));
            
        }else if strNew.count >= 3 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 3));
        }
        return strResult;
    }
    
    func bankCardNumberFormat() -> String {
        let strNew = self.replacingOccurrences(of: " ", with: "");
        var strResult = strNew;
        if strNew.count >= 16 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 4));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 9));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 14));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 19));
        }else if strNew.count >= 13 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 4));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 9));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 14));
        }else if strNew.count >= 9 {
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 4));
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 9));
        }else if strNew.count >= 4{
            strResult.insert(" ", at: strResult.index(strResult.startIndex, offsetBy: 4));
        }
        return strResult;
    }
    
    var removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    
    public func getStringByteLength(string:String) ->Int{
        var bytes: [UInt8] = [];
        for char in string.utf8{
            bytes.append(char.advanced(by:0))
            
        }
        return bytes.count
        
    }
    
}
