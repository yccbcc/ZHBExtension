

//
//  String+Path.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/3.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation

extension String{
    
    /**
     *  获取Document路径
     */
    static func documentPath() -> String {
      let documentArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        return documentArray[documentArray.count-1];
    }
    
    /**
     *  获取cache路径
     */
    static func cachePath() -> String {
        let cachePathArray = NSSearchPathForDirectoriesInDomains(.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        return cachePathArray[cachePathArray.count-1];
    }
    
    /**
     *  获取temp路径
     */
    static func tempPatch() -> String {
        return NSTemporaryDirectory();
    }
    
    /**
     *  添加Document文件路径
     *
     */
    func appendDocumentPath() -> String {
        return String.documentPath().appending(self);
    }
    
    /**
     *  添加cache文件路径
     */
    func appendCachePath() -> String {
        return String.cachePath().appending(self);
    }
    
    /**
     *  添加temp路径
     */
    func appendTempPath() -> String {
        return String.tempPatch().appending(self);
    }
    
    
    
}
