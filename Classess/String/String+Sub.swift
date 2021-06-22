//
//  String+Sub.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/9.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation

extension String {
    
    /** 左闭右闭*/
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(from: Int) -> String {
        
        return self.substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        
        return self.substring(from: from, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        
        return self.substring(from: start, to: to)
    }
    

        /// range转换为NSRange
        func nsRange(from range: Range<String.Index>) -> NSRange {
            return NSRange(range, in: self)
        }
    
}

/**
 let string = "Hello,World!"
 string.substring(from: 1, to: 7) print: ello,Wo
 
 string.substring(to: 7) print: Hello,Wo
 
 string.substring(from: 3) print: lo,World!
 
 string.substring(from: 1, length: 4) print: ello
 
 string.substring(length: 4, to: 7) print: o,Wo
 
 Updated substring(from: Int?, length: Int) to support starting from zero.
 */
