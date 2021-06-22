//
//  Data+Convert.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/16.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation

extension Data {
    
    
    /** data -> String */
    static func getStringFromData(data:Data) -> String?{
        return String(data: data, encoding: .utf8)
    }
    
    /** String -> data */
    static func getDataFromString(_ string:String) -> Data?{
        return string.data(using: .utf8)
    }
    
    /** obj -> Data */
    static func getDataFromObj(_ obj:Any) -> Data? {
        return try? JSONSerialization.data(withJSONObject: obj, options: [])
    }
    
    /** data -> obj */
    static func getObjFromData(_ data:Data) -> Any?{
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    /** jsonString->dic */
    static func getDictionaryFromJSONString(jsonString:String) ->Dictionary<String, Any?>?{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as? Dictionary<String,Any?>
        }
        return Dictionary<String,Any>()
    }
    /** jsonString->arr */
    static func getArrayFromJSONString(jsonString:String) ->Array<Any>?{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as? Array ?? []
        }
        return Array<Any>.init()
    }
    
    /** dic->jsonString */
    static func getJSONStringFromDictionary(dictionary:Dictionary<String, Any>) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : Data! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as Data?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
    /** arr->jsonString */
    static func getJSONStringFromArray(array:Array<Any>) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : Data! = try? JSONSerialization.data(withJSONObject: array, options: []) as Data?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }

}
