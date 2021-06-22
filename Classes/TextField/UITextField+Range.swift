//
//  UITextField+Range.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/9.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension UITextField {

    func selectedRange() -> NSRange? {
        let beginning = self.beginningOfDocument;
        let selectedRange:UITextRange? = self.selectedTextRange;
        guard let resultRange = selectedRange else { return nil }
        let selectedStart = resultRange.start;
        let selectedEnd = resultRange.end;
        let location = self.offset(from: beginning, to: selectedStart);
        let length = self.offset(from: selectedStart, to: selectedEnd);
        return NSMakeRange(location, length);
    }
    
    func setSelectedRange(range:NSRange?) -> Void {
        guard let rangeResult = range else { return }
        let beginning = self.beginningOfDocument;
        let startPosition:UITextPosition? = self.position(from: beginning, offset: rangeResult.location+rangeResult.length);
        let endPosition:UITextPosition? = self.position(from: beginning, offset: rangeResult.location+rangeResult.length);
        if let starPos = startPosition,let endPos = endPosition {
            let selectionRange = self.textRange(from: starPos, to: endPos);
             self.selectedTextRange = selectionRange;
        }
    }
    
    //在输入框输入钱数时,是否允许输入.在代理 :shouldChangeCharactersIn 中调用.
    func isAllowInputOfMoney(txt:String) -> Bool {
        if txt == "." || ["00","01","02","03","04","05","06","07","08","09"].contains(txt) {
            return false;
        }
        let noCommaTxt = txt.replacingOccurrences(of: ".", with: "")
        if txt.count - noCommaTxt.count >= 2 {
            return false;
        }
        if txt.contains(".") {
            let arr = txt.split(separator: ".")
            if arr.count == 2{
                let subStr = arr[1]
                if subStr.count > 2{
                    return false;
                }
            }
        }
        return true;
    }
    //输入框输入钱数时,是否是有效的数字,允许执行下一步
    func isVaildNumOfMoney(txt:String) -> String? {
        var theTxt = txt;
        if theTxt.hasSuffix(".") {
            theTxt = String(theTxt.prefix(theTxt.count-1))
        }
        for c in ["1","2","3","4","5","6","7","8","9"] {
            if theTxt.contains(c) {
                return theTxt
            }
        }
        return nil
    }
}
