//
//  Date+Ext.swift
//  lwWallet
//
//  Created by zhaohongbin on 2019/7/16.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation


extension Date {
    
    //MARK: - 现在的时间戳
    static func nowTimeStamp() -> String {
        return String(NSInteger(Date().timeIntervalSince1970) * 1000)
    }
    static func nowShortTimeStamp() -> String {
        return String(NSInteger(Date().timeIntervalSince1970))
    }
    
    //MARK: - Date/字符串/时间戳 互相转换
    /** 从时间戳获取Date */
    static func dateFromTimeStamp(_ timestamp:Any?) -> Date? {
        if !(self.isTrueTimestamp(timestamp)) {
            return nil;
        }
        var timeStr = timestamp as! String;
        if timeStr.count == 13 {
            timeStr = String(timeStr.prefix(10))
        } else if timeStr.count == 10 {
            
        }else {
            print("时间戳转换成Date失败,位数不对:",timeStr)
            return nil;
        }
        return Date(timeIntervalSince1970: TimeInterval(timeStr) ?? 0)
    }
    /** 从string获取Date 默认: YYYY-MM-dd HH:mm:ss */
    static func dateFromString(_ string:String?,formatStr:String?) -> Date?{
        if string == nil {
            return nil;
        }
        let myFormat = DateFormatter.init()
        myFormat.dateFormat = formatStr ?? "YYYY-MM-dd HH:mm:ss"
        return myFormat.date(from: string!)
    }
    
    /** 从Date获取String 默认: YYYY-MM-dd HH:mm:ss */
    static func stringFromDate(_ date:Date?,format:String?) -> String? {
        if date == nil {
            return nil;
        }
        let myFormat = DateFormatter.init()
        myFormat.dateFormat = format ?? "YYYY-MM-dd HH:mm:ss"
        return myFormat.string(from: date!)
    }
    
    /** 从时间戳获取String */
    static func stringFromTimestamp(_ timestamp:String?,format:String?) -> String? {
        if !self.isTrueTimestamp(timestamp) {
            return nil;
        }
        let date = self.dateFromTimeStamp(timestamp!)
        if (date != nil) {
            return Date.stringFromDate(date!, format: format ?? "YYYY-MM-dd HH:mm:ss")
        }
        return nil;
    }
    
    
    /** 从Date获取时间戳 */
    
    static func timestampFromDate(_ date:Date?)->String?{
        if date == nil {
            return nil;
        }
        let time = date!.timeIntervalSince1970;
        return String(NSInteger(time))
    }
    
    /** 从string获取时间戳 */
    static func timestampFromString(_ string:String?,format:String?) -> String? {
        let date = Date.dateFromString(string, formatStr: format);
        if date != nil {
            return Date.timestampFromDate(date!)
        }
        return nil;
    }
    
    //MARK: - 对日期的一些判断
    /** 在同一天 */
    func isSameDay(_ date:Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    func isYesterday() -> Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    func isTomorrow() -> Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    func isWeekend() -> Bool {
        return Calendar.current.isDateInWeekend(self)
    }
    
    //MARK: - 对日期的一些信息
    /** 获取周几 */
    func weekDayShortStr() -> String? {
        return self.getWeekDayStringWithArray(["", "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"])
    }
    /** 获取星期几 */
    func weekDayStr() -> String? {
        return self.getWeekDayStringWithArray(["", "周日", "周一", "周二", "周三", "周四", "周五", "周六"])
    }
    
    private func getWeekDayStringWithArray(_ arr:Array<String>) -> String? {
        let weekDay = self.allDateComponent().weekday
        if weekDay != nil && arr.count > weekDay! {
            return arr[weekDay!]
        }else{
            return nil;
        }
    }
    
    /** 获取几月 */
    func monthString() -> String? {
        let arr = ["", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        let month = self.allDateComponent().month
        if month != nil && arr.count > month! {
            return arr[month!]
        }else{
            return nil;
        }
    }
    
    //MARK: - private方法
    static func isTrueTimestamp(_ timestamp:Any?) -> Bool {
        if timestamp == nil {
            return false;
        } else if timestamp is NSNull {
            return false;
        }else if let time = timestamp as? String {
            if time.count == 0 {
                return false;
            }else{
                return true;
            }
        }else{
            return false;
        }
        
    }
    
    func allDateComponent() -> DateComponents {
        let calendar = Calendar.init(identifier: .gregorian)
        return calendar.dateComponents([.year,.month,.day,.hour,.minute,.second,.weekday], from: self)
    }
    
}
