//
//  UIImage+Compress.swift
//  lwPlatinum
//
//  Created by zhaohongbin on 2019/9/26.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage{
    
    static func compressImage(_ image: UIImage, toByte maxLength: Int) -> Data {
        var compression: CGFloat = 1
        
        var data:Data = image.jpegData(compressionQuality: compression)!
        guard data.count > maxLength else { return data }
        
        // Compress by size
        var max: CGFloat = 1
        var min: CGFloat = 0
        for _ in 0..<6 {
            compression = (max + min) / 2
            data = image.jpegData(compressionQuality: compression)!
            if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
                min = compression
            } else if data.count > maxLength {
                max = compression
            } else {
                break
            }
        }
        
        if data.count < maxLength { return data }
        var resultImage: UIImage = UIImage(data: data)!
        
        // Compress by size
        var lastDataLength: Int = 0
        while data.count > maxLength, data.count != lastDataLength {
            lastDataLength = data.count
            let ratio: CGFloat = CGFloat(maxLength) / CGFloat(data.count)
            let size: CGSize = CGSize(width: Int(resultImage.size.width * sqrt(ratio)),
                                      height: Int(resultImage.size.height * sqrt(ratio)))
            UIGraphicsBeginImageContext(size)
            resultImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            resultImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            data = resultImage.jpegData(compressionQuality: compression)!
        }
        return data
    }
}
