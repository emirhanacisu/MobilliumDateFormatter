//
//  MobilliumDateFormatter.swift
//  MobilliumDateFormatter
//
//  Created by Mehmet Salih Aslan on 6.02.2019.
//

import Foundation

public class MobilliumDateFormatter {
    
    public static var locale: Locale?
    
}

public extension Date {
    
    enum Format {
        
        /// 2-digit year
        /// Example: 08
        case yy
        
        /// 4-digit year
        /// Example: 2008
        case yyyy
        
        /// The quarter of the year. Use QQ if you want zero padding.
        /// Example: 4
        case Q
        
        /// Quarter including "Q"
        /// Example: Q4
        case QQQ
        
        /// Quarter spelled out
        /// Example: 4th quarter
        case QQQQ
        
        /// The numeric month of the year. A single M will use '1' for January.
        /// Example: 12
        case M
        
        /// The numeric month of the year. A double M will use '01' for January.
        /// Example: 12
        case MM
        
        /// The shorthand name of the month
        /// Example: Dec
        case MMM
        
        /// Full name of the month
        /// Example: December
        case MMMM
        
        /// Narrow name of the month
        /// Example: D
        case MMMMM
        
        /// The day of the month. A single d will use 1 for January 1st.
        /// Example: 14
        case d
        
        /// The day of the month. A double d will use 01 for January 1st.
        /// Example: 14
        case dd
        
        /// The day of week in the month
        /// Example: 3rd Tuesday in December
        case F
        
        /// The day of week in the month
        /// Example: Tues
        case E
        
        /// The full name of the day
        /// Example: Tuesday
        case EEEE
        
        /// The narrow day of week
        /// Example: T
        case EEEEE
        
        /// The 12-hour hour.
        /// Example: 4
        case h
        
        /// The 12-hour hour padding with a zero if there is only 1 digit
        /// Example: 04
        case hh
        
        /// The 24-hour hour.
        /// Example: 16
        case H
        
        /// The 24-hour hour padding with a zero if there is only 1 digit.
        /// Example: 16
        case HH
        
        /// AM / PM for 12-hour time formats
        /// Example: PM
        case a
        
        /// The minute, with no padding for zeroes.
        /// Example: 35
        case m
        
        /// The minute with zero padding.
        /// Example: 35
        case mm
        
        /// The seconds, with no padding for zeroes.
        /// Example: 8
        case s
        
        /// The seconds with zero padding.
        /// Example: 08
        case ss
        
        //MARK: Custom
        /// Custom Format
        case custom(rawValue: String)
        
        /// The corresponding `String` value.
        public var rawValue: String {
            switch self {
            case .yy:                           return "yy"
            case .yyyy:                         return "yyyy"
            case .Q:                            return "Q"
            case .QQQ:                          return "QQQ"
            case .QQQQ:                         return "QQQQ"
            case .M:                            return "M"
            case .MM:                           return "MM"
            case .MMM:                          return "MMM"
            case .MMMM:                         return "MMMM"
            case .MMMMM:                        return "MMMMM"
            case .d:                            return "d"
            case .dd:                           return "dd"
            case .F:                            return "F"
            case .E:                            return "E"
            case .EEEE:                         return "EEEE"
            case .EEEEE:                        return "EEEEE"
            case .h:                            return "h"
            case .hh:                           return "hh"
            case .H:                            return "H"
            case .HH:                           return "HH"
            case .a:                            return "a"
            case .m:                            return "m"
            case .mm:                           return "mm"
            case .s:                            return "s"
            case .ss:                           return "ss"
            case .custom(let rawValue):         return rawValue
            }
        }
        
        /// Init custom format
        init(_ rawValue: String) {
            self = .custom(rawValue: rawValue)
        }
        
    }
    
    /// Creates a Date using 'TimeInterval'
    static func from(_ timeInterval: TimeInterval) -> Date? {
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    /// Creates a Date using 'dateString' and 'Date.Format'.
    static func from(_ dateString: String, format: Date.Format) -> Date? {
        let dateformatter = DateFormatter()
        dateformatter.locale = MobilliumDateFormatter.locale
        dateformatter.dateFormat = format.rawValue
        return dateformatter.date(from: dateString)
    }
    
    /// Creates a String using 'Date'.
    func to(_ format: Date.Format) -> String {
        let dateformatter: DateFormatter = DateFormatter()
        dateformatter.locale = MobilliumDateFormatter.locale
        dateformatter.dateFormat = format.rawValue
        return dateformatter.string(from: self)
    }
    
    func isNextWeek() -> Bool {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: Date())
        let nextWeekOfYear = calendar.component(.weekOfYear, from: self)
        return weekOfYear == nextWeekOfYear - 1
    }
    
    func isThisWeek() -> Bool {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: Date())
        let currenWeekOfYear = calendar.component(.weekOfYear, from: self)
        return weekOfYear == currenWeekOfYear
    }
    
    func isLastWeek() -> Bool {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: Date())
        let lastWeekOfYear = calendar.component(.weekOfYear, from: self)
        return weekOfYear == lastWeekOfYear + 1
    }

    func isNextMonth() -> Bool {
        let calendar = Calendar.current
        let monthOfTheYear = calendar.component(.month, from: Date())
        let nextMonthOfTheYear = calendar.component(.month, from: self)
        return monthOfTheYear == nextMonthOfTheYear - 1
    }
    
    func isThisMonth() -> Bool {
        let calendar = Calendar.current
        let monthOfTheYear = calendar.component(.month, from: Date())
        let currentMonthOfTheYear = calendar.component(.month, from: self)
        return monthOfTheYear == currentMonthOfTheYear
    }
    
    func isLastMonth() -> Bool {
        let calendar = Calendar.current
        let monthOfTheYear = calendar.component(.month, from: Date())
        let lastMonthOfTheYear = calendar.component(.month, from: self)
        return monthOfTheYear == lastMonthOfTheYear + 1
    }
  
    /// Check if date is within today.
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    /// Check if date is within tomorrow.
    var isTomorow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    /// Check if date is within yesterday.
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    func isNextYear() -> Bool {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let nextYear = calendar.component(.year, from: self)
        return year == nextYear - 1
    }
    
    func isThisYear() -> Bool {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let currentYear = calendar.component(.year, from: self)
        return currentYear == year
    }
    
    func isLastYear() -> Bool {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let lastYear = calendar.component(.year, from: self)
        return year == lastYear + 1
    }
    
    func add(_ component: DateComponentType, count: Int) -> Date? {
        switch component {
        case .hour:
            return addHour(count)
        case .minute:
            return addMinute(count)
        default:
            break
        }
        return nil
    }
    
    private func addHour(_ count: Int) -> Date? {
        return Calendar.current.date(byAdding: .hour, value: count, to: self)
    }
    
    private func addMinute(_ count: Int) -> Date? {
        return Calendar.current.date(byAdding: .minute, value: count, to: self)
    }
    
}
