/*
NSArray.swift
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
import UIKit

extension NSArray {

    func _isLastIndex(index:Int) -> Bool {
        return (index == count - 1)
    }

    ///Joins an array of strings using the separator
    func _joinWithSeparator(separator:String) -> String {

        var joined = String()
        for (idx,obj) in self.enumerate() {
            let string = obj as! String

            if !(_isLastIndex(idx)) {
                joined = joined + string + separator
            }else {
                joined = joined + string
            }
        }

        return joined
    }

    ///helps prevent out of bounds access
    func _indexInBounds(index:Int) -> Bool {
        let inBounds = (self.count-1) >= index
        return inBounds
    }

    ///Joins an array of objects on a given object property
    func _joinOnObjectKey(key:String, separator:String) -> String {

        var joined = String()
        for obj in self {
            let value = obj.valueForKey(key) as! String
            joined = joined + value + separator
        }

        return joined
    }

    ///Returns count of the array as a CGFloat
    func _countAsFloat() -> CGFloat {
        return CGFloat(self.count)
    }
}


