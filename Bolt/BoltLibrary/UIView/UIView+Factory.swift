/*
UIView+Factory.swift
Created by Peng Chia on 4/7/15.

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

extension UIView {
    /// Xibs containing this view must be named after this class.
    /// Ex: MyView   ->  MyView.xib
    class func _newInstance() -> UIView {
        var name = _xibName()
        return _newInstanceFromXibNamed(name)
    }
    
    /// Returns a newly instantiated view from the input xib
    class func _newInstanceFromXibNamed(xibName : String) -> UIView {
        let views = NSBundle.mainBundle().loadNibNamed(xibName, owner: self, options: nil)
        return views[0] as! UIView
    }
    
    /// Returns the name of the xib
    class func _xibName() -> String {
        return NSStringFromClass(self.classForCoder()).componentsSeparatedByString(".").last!
    }
}