/*
NSNumber.swift
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

infix operator -- {}
infix operator ++ {}

extension NSNumber {
    
    ///Returns the number with the default currency of the device
    ///ex: $3.00
    func _currencyString(#maxFractionDigits: NSInteger) -> String? {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.maximumFractionDigits = maxFractionDigits
        return formatter.stringFromNumber(self)
    }
}

///Subtract two numbers
public func - (first: NSNumber, second:NSNumber) -> NSNumber {
    var value = first.doubleValue - second.doubleValue
    return NSNumber(double: value)
}

///Add two numbers
public func + (first: NSNumber, second:NSNumber) -> NSNumber {
    var value = first.doubleValue + second.doubleValue
    return NSNumber(double: value)
}

///Multiply two numbers
public func * (first: NSNumber, second:NSNumber) -> NSNumber {
    var value = first.doubleValue * second.doubleValue
    return NSNumber(double: value)
}

///Divide two numbers
public func / (first: NSNumber, second:NSNumber) -> NSNumber {
    var value = first.doubleValue / second.doubleValue
    return NSNumber(double: value)
}

///Postfix decrement two numbers
public postfix func -- (first: NSNumber) -> NSNumber {
    var value = first.floatValue - 1.0
    return NSNumber(float: value)
}

///Postfix increment two numbers
public postfix func ++ (first: NSNumber) -> NSNumber {
    var value = first.floatValue + 1.0
    return NSNumber(float: value)
}

