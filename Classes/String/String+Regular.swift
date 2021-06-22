//
//  String+Regular.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/3.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
public extension String{
    /**
     *  国内手机号验证
     */
    var isPhoneValue:Bool{
        let phoneRegex = "^(1)\\d{10}$";
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex);
        return phonePredicate.evaluate(with: self);
    }
    /**
     *  海外手机号验证
     */
    var isOverseasPhoneNumber:Bool{
        let phoneRegex = "^\\d{6,15}$";
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex);
        return phonePredicate.evaluate(with: self);
    }
    
    /**
     *  url验证
     */
    var isUrl:Bool{
        let compare = self.lowercased();
        if compare.hasPrefix("http://") || compare.hasPrefix("https://"){
            return true;
        }else{
            return false;
        }
    }
    
    /**
     *  邮箱验证
     */
    var isEmail:Bool{
        let stricterFilterString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        let emailCheck = NSPredicate.init(format: "SELF MATCHES %@", stricterFilterString);
        return emailCheck.evaluate(with: self);
    }

    
    var isBankCard:Bool{
        let value =  self.trimmingCharacters(in: CharacterSet.whitespaces);
        if value.count >= 16 {
            return true;
        }else{
            return false;
        }
        
    }
    
    var isName:Bool{
        let value =  self.trimmingCharacters(in: CharacterSet.whitespaces);
        let length = 2
        if value.count >= length{
            return true
        }else{
            return false;
            }
    }
    /**
     *  是否是IDCard
     */
    var isIDCard:Bool{
        let value =  self.trimmingCharacters(in: CharacterSet.whitespaces);
        var length = 0
        if value == ""{
            return false
        }else{
            length = value.count
            if length != 15 && length != 18{
                return false
            }
        }
        //省份代码
        let arearsArray = ["11","12", "13", "14",  "15", "21",  "22", "23",  "31", "32",  "33", "34",  "35", "36",  "37", "41",  "42", "43",  "44", "45",  "46", "50",  "51", "52",  "53", "54",  "61", "62",  "63", "64",  "65", "71",  "81", "82",  "91"]
        let valueStart2 = (value as NSString).substring(to: 2)
        var arareFlag = false
        if arearsArray.contains(valueStart2){
            
            arareFlag = true
        }
        if !arareFlag{
            return false
        }
        var regularExpression = NSRegularExpression()
        
        var numberofMatch = Int()
        var year = 0
        switch (length){
        case 15:
            year = Int((value as NSString).substring(with: NSRange(location:6,length:2)))!
            if year%4 == 0 || (year%100 == 0 && year%4 == 0){
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{
                    
                    
                }
                
                
            }else{
                do{
                    regularExpression =  try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{}
            }
            
            numberofMatch = regularExpression.numberOfMatches(in: value, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.count))
            
            if(numberofMatch > 0) {
                return true
            }else {
                return false
            }
            
        case 18:
            year = Int((value as NSString).substring(with: NSRange(location:6,length:4)))!
            if year%4 == 0 || (year%100 == 0 && year%4 == 0){
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{
                    
                }
            }else{
                do{
                    regularExpression =  try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{}
            }
            
            numberofMatch = regularExpression.numberOfMatches(in: value, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.count))
            
            if(numberofMatch > 0) {
                let s =
                    (Int((value as NSString).substring(with: NSRange(location:0,length:1)))! +
                        Int((value as NSString).substring(with: NSRange(location:10,length:1)))!) * 7 +
                        (Int((value as NSString).substring(with: NSRange(location:1,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:11,length:1)))!) * 9 +
                        (Int((value as NSString).substring(with: NSRange(location:2,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:12,length:1)))!) * 10 +
                        (Int((value as NSString).substring(with: NSRange(location:3,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:13,length:1)))!) * 5 +
                        (Int((value as NSString).substring(with: NSRange(location:4,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:14,length:1)))!) * 8 +
                        (Int((value as NSString).substring(with: NSRange(location:5,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:15,length:1)))!) * 4 +
                        (Int((value as NSString).substring(with: NSRange(location:6,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:16,length:1)))!) *  2 +
                        Int((value as NSString).substring(with: NSRange(location:7,length:1)))! * 1 +
                        Int((value as NSString).substring(with: NSRange(location:8,length:1)))! * 6 +
                        Int((value as NSString).substring(with: NSRange(location:9,length:1)))! * 3
                
                let Y = s%11
                var M = "F"
                let JYM = "10X98765432"
                
                M = (JYM as NSString).substring(with: NSRange(location:Y,length:1))
                if M == (value as NSString).substring(with: NSRange(location:17,length:1))
                {
                    return true
                }else{return false}
                
                
            }else {
                return false
            }
            
        default:
            return false
        }
        
    }
    
    /**
     *  是否是汉字
     */
    var isHanZi:Bool{
        if self.count == 0{
        return false;
        }
        let regex = "[\u{4e00}-\u{9fa5}]+";
        let pred = NSPredicate.init(format: "SELF MATCHES %@", regex);
        return pred.evaluate(with: self);
    }
    
    /**
     *  是否包含系统表情
     */
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x1F1E6...0x1F1FF, // Regional country flags
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
            127000...127600, // Various asian characters
            65024...65039, // Variation selector
            9100...9300, // Misc items
            8400...8447: // Combining Diacritical Marks for Symbols
                return true
            default:
                continue
            }
        }
        return false
    }
    
}
