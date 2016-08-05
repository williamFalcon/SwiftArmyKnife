/*
NSDate.swift
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

public extension NSDate {

    ///The Now time
    class func _now() -> NSDate {
        return NSDate()
    }

    ///Now time in Eastern Standard Time
    class func _nowEST() -> NSDate {
        let locale = NSLocale(localeIdentifier: POSIX.US)
        let formatter = NSDateFormatter()
        formatter.locale = locale
        formatter.dateFormat = DateFormat.UTC
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)

        return formatter.dateFromString(NSDate._now().description)!
    }

    ///returns utc timestamp
    func _UTCTimestamp() -> String {
        return _dateString(DateFormat.UTC)
    }

    ///Date tomorrow
    class func _tomorrow() -> NSDate {
        let date = _now()
        return date._addDays(1)
    }

    ///Date yesterday
    class func _yesterday() -> NSDate {
        let date = _now()
        return date._addDays(-1)
    }

    ///Add days to the date
    func _addDays(numberOfDays: NSInteger) -> NSDate {
        let newDate = self.dateByAddingTimeInterval(NSTimeInterval(60*60*24*numberOfDays))
        return newDate
    }
    
    func _addMilliseconds(ms: NSInteger) -> NSDate {
        let newDate = self.dateByAddingTimeInterval(NSTimeInterval(ms))
        return newDate
    }

    //MARK: - Strings
    ///Returns a date string using the given format
    ///Ex: "mmm-yyyy" returns May 2015
    func _dateString(format: String) -> String {
        return dateStringWithFormat(format)
    }

    ///Returns the day as a string
    ///Ex: 5
    func _dayString(format: String) -> String {
        return dateStringWithFormat(format)
    }

    ///Returns the weekday as a string
    ///Ex: Monday
    func _weekdayString() -> String {
        return dateStringWithFormat("EEEE")
    }

    ///Returns the Month as a string
    ///Ex: May
    func _monthString(format: String) -> String {
        return dateStringWithFormat(format)
    }

    ///Returns the year as a string
    ///Ex: 2015
    func _yearString(format: String) -> String {
        return dateStringWithFormat(format)
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
        let formatter = NSDateFormatter()
        formatter.dateFormat = DateFormat.UTC
        formatter.timeZone = NSTimeZone(name: "UTC")
        
        return formatter.stringFromDate(self)
    }

    ///Private date formatter
    private func dateStringWithFormat(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format

        return formatter.stringFromDate(self)
    }

    //MARK: - Components
    ///Returns the day as an NSInteger
    func _day() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: self)
        return components.day
    }

    ///Returns the month as an NSInteger
    func _month() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Month, fromDate: self)
        return components.month
    }

    ///Returns the year as an NSInteger
    func _year() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: self)
        return components.year
    }

    ///Returns the weekday as an NSInteger
    func _weekday() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Weekday, fromDate: self)
        return components.weekday
    }

    ///Returns the hour as an NSInteger
    func _hour() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: self)
        return components.hour
    }

    ///Returns the minute as an NSInteger
    func _minute() -> NSInteger {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Minute, fromDate: self)
        return components.minute
    }

    ///Returns number of minutes passed today
    func _minutesToday() -> NSInteger {
        let hours = Double(self._hour())
        let mins = Double(self._minute())

        return NSInteger((hours * Double(60.0)) + mins)
    }

    //MARK: - Timing
    ///Returns number of nights until a date
    func _numberOfNightsUntilDate(date:NSDate) -> NSInteger {
        let days = _numberOfDaysUntilDateInclusive(date)
        return days - 1
    }

    ///Returns the number of days until a date, including the start and end date in the count
    func _numberOfDaysUntilDateInclusive(endDate:NSDate) -> NSInteger {
        let calendar = NSCalendar.currentCalendar()
        let from = self
        let components = calendar.components(.Day, fromDate: from, toDate: endDate, options: NSCalendarOptions())

        return components.day + 1
    }

    ///Removes the time from the date. Makes the time 00:00:00
    func _stripTime() -> NSDate {
        let dateUnits: NSCalendarUnit = [NSCalendarUnit.Year, NSCalendarUnit.Day, NSCalendarUnit.Month]

        let components = NSCalendar.currentCalendar().components(dateUnits, fromDate: self)

        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

        return calendar!.dateFromComponents(components)!
    }

    ///Returns yes if date is between two dates, or is is the start or end date
    func _isBetweenStartDateInclusive(start:NSDate, endDate end:NSDate) -> Bool{
        let stripped = self._stripTime()
        let afterStart = stripped._isLaterThanDate(start._stripTime())
        let beforeEnd = stripped._isEarlierThanDate(end._stripTime())

        let inBetween = (afterStart && beforeEnd)
        return inBetween
    }

    ///Returns yes if date is earlier than current date
    func _isEarlierThanDate(date: NSDate) -> Bool {
        return self.earlierDate(date) == self
    }

    ///Returns yes if date is after current date
    func _isLaterThanDate(date: NSDate) -> Bool {
        return self.laterDate(date) == self
    }

    ///Returns yes if date is in the same month
    func _isSameMonth(date: NSDate) -> Bool {
        return self._month() == date._month()
    }

    ///Returns yes if date is in the same year
    func _isSameYear(date: NSDate) -> Bool {
        return self._year() == date._year()
    }

    ///Returns yes if date is the same day
    func _isSameDay(date: NSDate) -> Bool {
        return self._day() == date._day()
    }

    ///Returns yes if two days are equal Irregardless of time.
    ///Equal if day, month and year are the same
    func _equalsDate(date:NSDate) -> Bool {
        return self._isSameDay(date) && self._isSameMonth(date) && self._isSameYear(date)
    }
}

//MARK: - Operators
///Adds a day to the date
public postfix func ++ (date: NSDate) -> NSDate {
    let newDate = date._addDays(1)
    return newDate
}

///Removes a day from the date
public postfix func -- (date: NSDate) -> NSDate {
    let newDate = date._addDays(-1)
    return newDate
}

///Adds a day to the date
public func + (date: NSDate, numberOfDays: NSInteger) -> NSDate {
    let newDate = date._addDays(numberOfDays)
    return newDate
}