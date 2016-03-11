/*
NSMutableAttributedString.swift
Created by William Falcon on 5/14/15.

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

import UIKit

extension NSMutableAttributedString {
    
    ///Returns range of whole string (0->length)
    func _fullRange() -> NSRange {
        return NSRange(location: 0, length: self.length)
    }
    
    ///Sets text color
    func _setTextColor(color:UIColor) {
        self.addAttribute(NSForegroundColorAttributeName, value: color, range: _fullRange())
    }
    
    func _setTextColorInrange(color:UIColor, range:NSRange) {
        self.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
    }
    
    ///Sets text font
    func _setTextFont(font:UIFont) {
        self.addAttribute(NSFontAttributeName, value: font, range: _fullRange())
    }
    
    ///Sets strike through
    func _setStrikeThrough() {
        self.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: _fullRange())
    }
    
    func _setStrikeThroughInRange(range:NSRange) {
        self.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: range)
    }
    
    ///Changes line spacing for the attributed string
    func _setLineSpacing(value:CGFloat) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = value
        paragraphStyle.lineHeightMultiple = 0.5
        
        self.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, self.length))
    }
}

///Enables string concatenation
public func + (left:NSMutableAttributedString, right:NSMutableAttributedString) -> NSMutableAttributedString {
    
    let combined = left
    combined.appendAttributedString(right)
    return combined
}
