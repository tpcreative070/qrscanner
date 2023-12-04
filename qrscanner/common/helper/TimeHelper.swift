//
//  TimeHelper.swift
//  qrscanner
//
//  Created by phong on 04/12/2023.
//

import Foundation

class TimeHelper {
    static let FormatYear = "dd-MM-YYYY"
    static let FormatHour = "dd-MM-YYYY HH:mm"
    static let FormatDateTime = "dd-MM-YYYY HH:mm:ss"
    static let FormatVNDate = "dd/MM/yyyy"
    static let FormatMonth = "MMMM yyyy"
    static let FormatMonthDay = "MMM d, yyyy HH:mm"
    static let FormatHM = "HH:mm"
    static let FormatBIRTHDAY = "dd/MM/yyyy"
    static let FormatSendEnc = "yyyyMMdd HH:mm:ss"
    static let StandardFormatTime = "yyyyMMdd HH:mm:ss"
    static let FormatTimeSecond = "yyyy-MM-dd'T'HH:mm:ss"
    static let StandardSaveContact = "yyyyMMddHHmmss"
    static let StandardFilterMonthYear = "MM/yyyy"
    static let StandardYearMonthQuery = "yyyyMM"
    static let StandardTransaction = "dd/MM/YYYY HH:mm:ss"
    static let StandardSortedDateTime = "ddMMYYYYHHmmss"
    // conver String to Date with format
    static func getTime(timeString: String, dateFormat: String = TimeHelper.FormatHour) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: timeString)
    }
    // conver String to Date with format
    static func getDateTime(timeString: String) -> Date? {
        var day : Int?
        var month : Int?
        var year : Int?
        var hour :Int?
        var minute :Int?
        
        let dateTime = timeString.split(separator: " ")
        if dateTime.count > 0 {
            let date = dateTime[0].split(separator: "-")
            if date.count > 0 {
                day = Int(date[0])
                month = Int(date[1])
                year = Int(date[2])
                
            }
            let time = dateTime[1].split(separator: ":")
            if time.count > 0{
                hour = Int(time[0])
                minute = Int(time[1])
            }
        }
        //      // Specify date components
        //        var dateComponents = DateComponents()
        //        dateComponents.year = year
        //        dateComponents.month = month
        //        dateComponents.day = day
        //        dateComponents.timeZone = TimeZone(abbreviation: "THA") // ThaiLand Standard Time
        //        dateComponents.hour = hour
        //        dateComponents.minute = minute
        //        let userCalendar = Calendar.current // user calendar
        //        userCalendar.date(bySettingHour: hour!, minute: minute!, second: 0, of: dateComponents.date!)
        //        let someDateTime = userCalendar.date(from: dateComponents)
        print(Date.calculateDate(day: day!, month: month!, year: year!, hour: hour!, minute: minute!))
        return Date.calculateDate(day: day!, month: month!, year: year!, hour: hour!, minute: minute!)
    }
    
    // conver Date to String with format
    static func getString(time : Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: time)
    }
    // conver String to String with in-out format
    static func converStringTime(inputTime: String, inputFormat: String, outputFormat : String = TimeHelper.FormatHour) -> String {
        if let inputDate = getTime(timeString: inputTime, dateFormat: inputFormat)  {
            return getString(time: inputDate, dateFormat: outputFormat)
        }
        return ""
    }
    
    static func convertStringTimeT(inputTime : String,inputFormat : String) -> String{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: inputTime) ?? Date()
        dateFormatter.dateFormat = inputFormat ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    static func getTimeFrom1970(time: Int, formatString: String = TimeHelper.FormatHour) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        return getString(time: date, dateFormat: formatString)
    }
    static func getTimeSince1970(time: Int, formatString: String = TimeHelper.FormatDateTime) -> String{
        let date = Date(timeIntervalSince1970: (TimeInterval(time) / 1000))
        return getString(time: date, dateFormat: formatString)
    }
   
    static func getDate(timeString: String) -> String? {
       let timeString = timeString.trimmingCharacters(in: .whitespacesAndNewlines)
        if timeString != "" {
        if timeString.contains("T") {
            let arr_date = timeString.split(separator: "T")
            let year = arr_date[0].prefix(4)
            let month_start = arr_date[0].index(arr_date[0].startIndex,offsetBy: 4)
            let month_end = arr_date[0].index(arr_date[0].endIndex,offsetBy: -2)
            let month = arr_date[0][month_start..<month_end]
            let day = arr_date[0].suffix(2)
            let hour = arr_date[1].prefix(2)
            let minute_start = arr_date[1].index(arr_date[1].startIndex,offsetBy: 2)
            let minute_end = arr_date[1].index(arr_date[1].endIndex,offsetBy: -2)
            let minute = arr_date[1][minute_start..<minute_end]
            
            let date = "\(day)-\(month)-\(year) \(hour):\(minute)"
            return date
        }
        else{
            let year = timeString.prefix(4)
            let month_start = timeString.index(timeString.startIndex,offsetBy: 4)
            let month_end = timeString.index(timeString.endIndex,offsetBy: -2)
            let month = timeString[month_start..<month_end]
            let day = timeString.suffix(2)
            let hour = 0
            let mini = 0
            let date = "\(day)-\(month)-\(year) \(hour):\(mini)"
            return date
        }
        }
        else{
            return TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        }
    }
}
