//
//  String+Calculate.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/15.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation


public extension String {
    
    //MARK: - 比较
    
    /** 比较
     self = 5,comStr = 1 => .Desceding / comStr = 6 => .Asceding / comStr = 5 => .Same
     */
    func compareNum(compareStr:String) -> ComparisonResult {
        let myDecimalNum = NSDecimalNumber.init(string: self)
        let compareDecimalNum = NSDecimalNumber.init(string: compareStr)
        return myDecimalNum.compare(compareDecimalNum)
    }
    
    //MARK: - 加减乘除
    
    /** 加 */
    func decimalNumberByAdding(_ by:String) -> String {
        let myDecimalNum = NSDecimalNumber.init(string: self)
        let addDecimalNum = NSDecimalNumber.init(string: by)
        let resultDecimalNum = myDecimalNum.adding(addDecimalNum)
        return resultDecimalNum.stringValue
    }
    /** 减去 */
    func decimalNumberBySubtracting(_ by:String) -> String {
        let myDecimalNum = NSDecimalNumber.init(string: self)
        let addDecimalNum = NSDecimalNumber.init(string: by)
        let resultDecimalNum = myDecimalNum.subtracting(addDecimalNum)
        return resultDecimalNum.stringValue
    }
    /** 除以 */
    func decimalNumByDividingBy(_ by:String) -> String {
        let myDecimalNum = NSDecimalNumber.init(string: self)
        let otherDecimalNum = NSDecimalNumber.init(string: by)
        let resultDecimalNum = myDecimalNum.dividing(by: otherDecimalNum)
        return resultDecimalNum.stringValue
    }
    /** 乘以 */
    func decimalNumByMultiplyingBy(_ by:String) -> String {
        let myDecimalNum = NSDecimalNumber.init(string: self)
        let otherDecimalNum = NSDecimalNumber.init(string: by)
        let resultDecimalNum = myDecimalNum.multiplying(by:otherDecimalNum)
        return resultDecimalNum.stringValue
    }
    
    //MARK: - 小数位截取
    
    /** 四舍五入 */
    func numberFormatterDecimalRoundPlainScale(_ scale:Int) -> String? {
        return self.numberFormatterDecimalRoundScale(scale, roundModel: nil)
    }
    /** 只入不舍 */
    func numberFormatterDecimalRoundCeilScale(_ scale:Int) -> String? {
        return self.numberFormatterDecimalRoundScale(scale, roundModel: .ceiling)
    }
    /** 只舍不如 */
    func numberFormatterDecimalRoundFloorScale(_ scale:Int) -> String? {
        return self.numberFormatterDecimalRoundScale(scale, roundModel: .floor)
    }
    
    
    private func numberFormatterDecimalRoundScale(_ scale:Int,roundModel:NumberFormatter.RoundingMode?) -> String? {
        let f = NumberFormatter.init()
        f.numberStyle = .decimal
        let num = f.number(from: self)
        
        let f2 = NumberFormatter.init()
        f2.numberStyle = .none;
        f2.minimumIntegerDigits = 1;
        f2.maximumFractionDigits = scale;
        f2.minimumFractionDigits = scale;
        if roundModel != nil {
            f2.roundingMode = roundModel!;
        }
        return f2.string(from: num!)
    }
    
    //MARK: - 分数形式
    
    /** 分数形式. scale:分数数字位保留几位小数  134,271.123%  */
    func numberFormatterPercentScale(_ scale:Int) -> String? {
        let f = NumberFormatter.init()
        f.numberStyle = .decimal
        let num = f.number(from: self)
        
        let f2 = NumberFormatter.init()
        f2.numberStyle = .percent;
        f2.minimumIntegerDigits = 1;
        f2.maximumFractionDigits = scale;
        f2.minimumFractionDigits = scale;
        return f2.string(from: num!)
    }
    
    //MARK: - 为数加逗号
    
    /** 为数加分号 2000 -> 2,000 */
    func numberFormatterDecimalWithComma(_ scale:Int) -> String? {
        let f = NumberFormatter.init()
        f.numberStyle = .decimal
        let num = f.number(from: self)
        let f2 = NumberFormatter.init()
        f2.numberStyle = .decimal;
        f2.minimumIntegerDigits = 1;
        f2.maximumFractionDigits = scale;
        f2.minimumFractionDigits = scale;
        return f2.string(from: num!)
    }
    
    //MARK: - 分->元

    /** 分->元 无逗号  200012.19 => 2000.12  */
    func fenToYuanNoCommaScale(_ scale:Int) -> String? {
        let my100 = self.decimalNumByDividingBy("100")
        return my100.numberFormatterDecimalRoundPlainScale(scale)
    }
    /** 分->元 逗号  200012.19 => 2,000.12  */
    func fenToYuanWithCommaScale(_ scale:Int) -> String? {
        let my100 = self.decimalNumByDividingBy("100")
        let numStr = my100.numberFormatterDecimalRoundPlainScale(scale)
        return numStr?.numberFormatterDecimalWithComma(scale)
    }
    
}

