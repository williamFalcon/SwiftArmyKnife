
/*
Date.swift
Created by William Falcon on 2/15/15.

The MIT License (MIT)

Copyright (c) 2015 William Falcon
will@hacstudios.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Foundation

struct POSIX {
    static var US = "en_US_POSIX"
}

struct DateFormat {
    static var UTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
}

public extension Date {

    ///The Now time
    static func _now() -> Date {
        return Date()
    }

    ///Now time in Eastern Standard Time
    static func _nowEST() -> Date {
        let locale = NSLocale(localeIdentifier: POSIX.US)
        let formatter = DateFormatter()
        formatter.locale = locale as Locale!
        formatter.dateFormat = DateFormat.UTC
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!

        return formatter.date(from: Date._now().description)! as Date
    }

    ///returns utc timestamp
    func _UTCTimestamp() -> String {
        return _dateString(format: DateFormat.UTC)
    }

    ///Date tomorrow
    static func _tomorrow() -> Date {
        let date = _now()
        return date._addDays(numberOfDays: 1)
    }

    ///Date yesterday
    static func _yesterday() -> Date {
        let date = _now()
        return date._addDays(numberOfDays: -1)
    }

    ///Add days to the date
    func _addDays(numberOfDays: NSInteger) -> Date {
        let newDate = self.addingTimeInterval(TimeInterval(60*60*24*numberOfDays))
        return newDate
    }
    
    func _addMilliseconds(ms: NSInteger) -> Date {
        let newDate = self.addingTimeInterval(TimeInterval(ms))
        return newDate
    }

    //MARK: - Strings
    ///Returns a date string using the given format
    ///Ex: "mmm-yyyy" returns May 2015
    func _dateString(format: String) -> String {
        return dateStringWithFormat(format: format)
    }

    ///Returns the day as a string
    ///Ex: 5
    func _dayString(format: String) -> String {
        return dateStringWithFormat(format: format)
    }

    ///Returns the weekday as a string
    ///Ex: Monday
    func _weekdayString() -> String {
        return dateStringWithFormat(format: "EEEE")
    }

    ///Returns the Month as a string
    ///Ex: May
    func _monthString(format: String) -> String {
        return dateStringWithFormat(format: format)
    }

    ///Returns the year as a string
    ///Ex: 2015
    func _yearString(format: String) -> String {
        return dateStringWithFormat(format: format)
    }

    ///Returns yes if date is a weekend
    func _isWeekend() -> Bool {
        let weekday = self._weekday()
        if weekday == 1 || weekday == 7 {
            return true
        }
        return false
    }

    ///Returns yes if date is a weekday
    func _isWeekday() -> Bool {
        return !self._isWeekend()
    }
    
    func _dateGMTString() -> NSString {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.UTC
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        return formatter.string(from: self as Date) as NSString
    }

    ///Private date formatter
    private func dateStringWithFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format

        return formatter.string(from: self as Date)
    }

    //MARK: - Components
    ///Returns the day as an NSInteger
    func _day() -> NSInteger {
        return Calendar.current.component(.day, from: self as Date)
    }

    ///Returns the month as an NSInteger
    func _month() -> NSInteger {
        return Calendar.current.component(.month, from: self as Date)
    }

    ///Returns the year as an NSInteger
    func _year() -> NSInteger {
        return Calendar.current.component(.year, from: self as Date)
    }

    ///Returns the weekday as an NSInteger
    func _weekday() -> NSInteger {
        return Calendar.current.component(.weekday, from: self as Date)
    }

    ///Returns the hour as an NSInteger
    func _hour() -> NSInteger {
        return Calendar.current.component(.hour, from: self as Date)
    }

    ///Returns the minute as an NSInteger
    func _minute() -> NSInteger {
        return Calendar.current.component(.minute, from: self as Date)
    }

    ///Returns number of minutes passed today
    func _minutesToday() -> NSInteger {
        let hours = Double(self._hour())
        let mins = Double(self._minute())

        return NSInteger((hours * Double(60.0)) + mins)
    }

    //MARK: - Timing
    ///Returns number of nights until a date
    func _numberOfNightsUntilDate(date:Date) -> NSInteger {
        let days = _numberOfDaysUntilDateInclusive(endDate: date)
        return days - 1
    }

    ///Returns the number of days until a date, including the start and end date in the count
    func _numberOfDaysUntilDateInclusive(endDate:Date) -> NSInteger {
        let calendar = NSCalendar.current
        let from = self
        let unitFlags = Set<Calendar.Component>([.day])
        let components = calendar.dateComponents(unitFlags, from: from as Date, to: endDate as Date)

        return components.day! + 1
    }

    ///Removes the time from the date. Makes the time 00:00:00
    func _stripTime() -> Date {
        let unitFlags = Set<Calendar.Component>([.year, .day, .month])
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(unitFlags, from: self)

        return calendar.date(from: components)!
    }

    ///Returns yes if date is between two dates, or is is the start or end date
    func _isBetweenStartDateInclusive(start:Date, endDate end:Date) -> Bool{
        let stripped = self._stripTime()
        let afterStart = stripped._isLaterThanDate(date: start._stripTime())
        let beforeEnd = stripped._isEarlierThanDate(date: end._stripTime())

        let inBetween = (afterStart && beforeEnd)
        return inBetween
    }

    ///Returns yes if date is earlier than current date
    func _isEarlierThanDate(date: Date) -> Bool {
        return self.compare(date) == .orderedAscending
    }

    ///Returns yes if date is after current date
    func _isLaterThanDate(date: Date) -> Bool {
        return self.compare(date) == .orderedDescending
    }

    ///Returns yes if date is in the same month
    func _isSameMonth(date: Date) -> Bool {
        return self._month() == date._month()
    }

    ///Returns yes if date is in the same year
    func _isSameYear(date: Date) -> Bool {
        return self._year() == date._year()
    }

    ///Returns yes if date is the same day
    func _isSameDay(date: Date) -> Bool {
        return self._day() == date._day()
    }

    ///Returns yes if two days are equal Irregardless of time.
    ///Equal if day, month and year are the same
    func _equalsDate(date:Date) -> Bool {
        return self._isSameDay(date: date) && self._isSameMonth(date: date) && self._isSameYear(date: date)
    }
}

//MARK: - Operators
///Adds a day to the date
public postfix func ++ (date: Date) -> Date {
    let newDate = date._addDays(numberOfDays: 1)
    return newDate
}

///Removes a day from the date
public postfix func -- (date: Date) -> Date {
    let newDate = date._addDays(numberOfDays: -1)
    return newDate
}

///Adds a day to the date
public func + (date: Date, numberOfDays: NSInteger) -> Date {
    let newDate = date._addDays(numberOfDays: numberOfDays)
    return newDate
}
