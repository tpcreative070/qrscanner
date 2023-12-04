//
//  DateExtension.swift
//  qrscanner
//
//  Created by phong on 04/12/2023.
//

import Foundation
extension Date {
  
  var millisecondsSince1970:Int {
    return Int((self.timeIntervalSince1970 * 1000.0).rounded())
  }
    
  var milliseconds:Int {
        return Int((self.timeIntervalSince1970).rounded())
  }
    
  func toString() -> String {
    let format = DateFormatter()
    format.dateFormat = "yyyy-MM-dd HH:mm"
    let formattedDate = format.string(from: self)
    return formattedDate
  }
  
  func toString( withFormat: String ) -> String {
    let format = DateFormatter()
    format.dateFormat = withFormat
    let formattedDate = format.string(from: self)
    return formattedDate
  }
  
  func timeAgoDisplay() -> String {
    let secondsAgo = Int (Date().timeIntervalSince(self))
    let minute = 60
    let hour = 60 * minute
    let day = 24 * hour
    let week = 7 * day
    if secondsAgo < minute {
      return "\(secondsAgo) seconds ago"
    } else if secondsAgo < hour {
      return "\(secondsAgo / minute ) minutes ago"
    } else if secondsAgo < day {
      return "\(secondsAgo / hour) hours ago"
    } else if secondsAgo < week {
      return "\(secondsAgo / day ) days ago"
    }
    return "\(secondsAgo / week) weeks ago"
  }
  
//    func currentTimeFormatSocket() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyyMMdd HH:mm:ss"
//        return dateFormatter.string(from: self)
//    }
  /**
   This function handle get current unix time
   Example: 1552622729.971545
  */
  func getCurrentTimeUnix() -> Double {
    return self.timeIntervalSince1970
  }
    
  func getDayMonthyearHourMiniteSecond() -> (day: Int, month: Int, year : Int, hour : Int, minute :Int, second : Int ){
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        return (day,month,year,hour,minute,second)
  }
    
  static  func calculateDate(day: Int, month: Int, year : Int, hour : Int, minute :Int ) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
    let calculatDate = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(minute)")
        return calculatDate!
    }
}

