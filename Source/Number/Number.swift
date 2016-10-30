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

infix operator --
infix operator ++

public extension NSNumber {
    
    ///Returns the number with the default currency of the device
    ///ex: $3.00
    func _currencyString(maxFractionDigits: NSInteger) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.maximumFractionDigits = maxFractionDigits
        return formatter.string(from: self)
    }
}

///Subtract two numbers
public func - (first: NSNumber, second:NSNumber) -> NSNumber {
    let value = first.doubleValue - second.doubleValue
    return NSNumber(value: value)
}

///Add two numbers
public func + (first: NSNumber, second:NSNumber) -> NSNumber {
    let value = first.doubleValue + second.doubleValue
    return NSNumber(value: value)
}

///Multiply two numbers
public func * (first: NSNumber, second:NSNumber) -> NSNumber {
    let value = first.doubleValue * second.doubleValue
    return NSNumber(value: value)
}

///Divide two numbers
public func / (first: NSNumber, second:NSNumber) -> NSNumber {
    let value = first.doubleValue / second.doubleValue
    return NSNumber(value: value)
}

///Postfix decrement two numbers
public postfix func -- (first: NSNumber) -> NSNumber {
    let value = first.floatValue - 1.0
    return NSNumber(value: value)
}

///Postfix increment two numbers
public postfix func ++ (first: NSNumber) -> NSNumber {
    let value = first.floatValue + 1.0
    return NSNumber(value: value)
}

