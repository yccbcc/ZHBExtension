//
//  Data+String.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/2.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
public extension Data{
    
    //将十六进制字符串转化为 Data
    func data(from hexStr: String) -> Data {
        let bytes = self.bytes(from: hexStr)
        return Data(bytes: bytes)
        
    }
    // 将16进制字符串转化为 [UInt8]
    // 使用的时候直接初始化出 Data
    // Data(bytes: Array<UInt8>)
    func bytes(from hexStr: String) -> [UInt8] {
        assert(hexStr.count % 2 == 0, "输入字符串格式不对，8位代表一个字符")
        var bytes = [UInt8]()
        var sum = 0
        // 整形的 utf8 编码范围
        let intRange = 48...57
        // 小写 a~f 的 utf8 的编码范围
        let lowercaseRange = 97...102
        // 大写 A~F 的 utf8 的编码范围
        let uppercasedRange = 65...70
        for (index, c) in hexStr.utf8CString.enumerated() {
            var intC = Int(c.byteSwapped)
            if intC == 0 {
                break
            } else if intRange.contains(intC) {
                intC -= 48
            } else if lowercaseRange.contains(intC) {
                intC -= 87
            } else if uppercasedRange.contains(intC) {
                intC -= 55
            } else {
                assertionFailure("输入字符串格式不对，每个字符都需要在0~9，a~f，A~F内")
            }
            sum = sum * 16 + intC
            // 每两个十六进制字母代表8位，即一个字节
            if index % 2 != 0 {
                bytes.append(UInt8(sum))
                sum = 0
            }
        }
        return bytes
    }
    
    //十六进制字符串 转 整形：
    func integer(from hexStr: String) -> Int {
        var sum = 0
        // 整形的 utf8 编码范围
        let intRange = 48...57
        // 小写 a~f 的 utf8 的编码范围
        let lowercaseRange = 97...102
        // 大写 A~F 的 utf8 的编码范围
        let uppercasedRange = 65...70
        for c in hexStr.utf8CString {
            var intC = Int(c.byteSwapped)
            if intC == 0 {
                break
            } else if intRange.contains(intC) {
                intC -= 48
            } else if lowercaseRange.contains(intC) {
                intC -= 87
            } else if uppercasedRange.contains(intC) {
                intC -= 55
            } else {
                assertionFailure("输入字符串格式不对，每个字符都需要在0~9，a~f，A~F内")
            }
            sum = sum * 16 + intC
        }
        return sum
    }
    
    //Data 转 二进制String：Optional(4 bytes)("abcd"转化后的data数据) => 最后结果:<61626364>
    func string(from data: Data) -> String {
        return String(format: "%@", data as CVarArg)
    }
    
}
