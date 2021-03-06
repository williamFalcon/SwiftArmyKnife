/*
String.swift
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

/*
String for swift provides many of the String API convenience methods from javascript (and some from python).
*/
public extension String {

    /**
    Returns length of the string
    */
    var _length: Int {
        get {
            return self.characters.count
        }
    }

    //MARK: Subscripting
    /**
    Returns char at an index
    Example: string[0] == "a"
    */
    subscript (index: Int) -> Character {
        //support negative indices
        var i = index
        if i < 0 {
            i = self._length - abs(index)
        }

        //return the requested item
        return self[self.startIndex.advancedBy(i)]
    }

    /**
    Returns string at an index
    Example: string[0] == "a"
    */
    subscript (index: Int) -> String {
        return String(self[index] as Character)
    }

    /**
    Returns the index of the string
    Example: string = "habel" string["ab"] (returns 1)
    */
    subscript (string: String) -> Int {
        return _indexOf(string)!
    }

    /**
    Returns string in a range
    Example: string[0...2] == "abc"
    */
    subscript (range: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(range.startIndex), end: startIndex.advancedBy(range.endIndex)))
    }

    //MARK: - Searching
    /**
    Searches a string for a match against a regular expression, and returns the matches
    */
    func _matchesForRegex(regex: String) -> [String] {

        var results : [String] = []
        let regex = try? NSRegularExpression(pattern: regex, options: NSRegularExpressionOptions.CaseInsensitive)
        if let matches = regex?.matchesInString(self, options: [], range: NSMakeRange(0, self._length)) {
            for m in matches {
                let match = self[m.range.location..<m.range.location+m.range.length]
                results.append(match)
            }
        }
        return results
    }

    /**
    Searches a string for a specified value, or regular expression, and returns the position of the match
    */
    func _search(string:String?) -> Int? {
        var result : Int?
        if let match = self._indexOf(string) {
            result = match
        }
        return result
    }

    /**
    Searches a string for a specified value, or regular expression, and returns the position of the match
    */
    func _containsRegex(string:String?) -> Bool {
        return _matchesForRegex(string!).count > 0
    }

    /**
    Returns true if string contains input string
    */
    func _contains(s: String) -> Bool{
        return (self.rangeOfString(s) != nil) ? true : false
    }

    /**
    Returns the character at the specified index (position)
    */
    func _charAt(index:Int?) -> String? {
        var result : String?
        if let i = index {
            result =  self[i]
        }
        return result
    }

    //MARK: - Indexing
    /**
    Returns the position of the first found occurrence of a specified value in a string
    */
    func _indexOf(string: String?) -> Int? {
        var result: Int?
        if let s = string {
            let range = self.rangeOfString(s)!
            result = self.startIndex.distanceTo(range.startIndex)
        }
        return result
    }

    /**
    Returns the position of the last found occurrence of a specified value in a string
    */
    func _lastIndexOf(string: String?) -> Int? {
        var index : Int?
        if let s = string {
            let startingIndex = self._length - s._length

            //return nil if input string is larger than self
            if startingIndex < 0 {
                return nil
            }

            //iterate from the end until we find a match in the string
            //when found, break
            for (var i = startingIndex; i>=0; i--){
                let subString = self._substringFromIndex(i)!
                if subString._contains(s) {
                    index = i
                    break
                }
            }
        }
        return index
    }


    func _rangeOfString(sub:String) -> NSRange? {

        if let start = self._indexOf(sub) {
            return NSMakeRange(start, sub._length)
        }
        return nil
    }

    //MARK: - Substrings
    /**
    Extracts the characters from a string, after a specified index
    */
    func _substringFromIndex(index:Int) -> String? {
        var substring : String?
        if index <= self._length && index >= 0 {
            substring = self.substringFromIndex(self.startIndex.advancedBy(index))
        }
        return substring
    }

    /**
    Extracts the characters from a string, before a specified index
    */
    func _substringToIndex(index:Int) -> String? {

        var substring : String?
        if index <= self._length && index >= 0 {
            substring = self.substringToIndex(self.startIndex.advancedBy(index))
        }
        return substring
    }

    /// Extracts the characters from a string
    func _removeString(str:String) -> String? {

        let substr = self._replaceAll(str, replacement: "")
        return substr
    }

    /**
    Extracts a part of a string and returns a new string
    */
    func _substringFromIndex(index:Int, toIndex to:Int) -> String {
        return self[index...to]
    }

    /**
    Extracts a part of a string and returns a new string starting at an index and
    going for the length requested
    */
    func _substringFromIndex(index:Int, length:Int) -> String {
        return self[index...(index+length)]
    }

    /**
    Extracts a part of a string and returns a new string
    */
    func _slice(start: Int, end: Int) -> String {
        return self[start...end]
    }

    /**
    Splits a string into an array of substrings
    */
    func _splitOn(separator: String) -> [String] {
        let results = self.componentsSeparatedByString(separator)
        return results
    }
    //MARK: - Formatting

    /**
    Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced. Can take in an regular expression
    */
    func _replaceAll(regex: String?, replacement:String?) -> String {

        var result : String = self
        if let r = regex {
            if let rep = replacement {
                result = self.stringByReplacingOccurrencesOfString(r, withString: rep, options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            }
        }

        return result
    }

    /**
    Removes whitespace from both ends of a string
    */
    func _trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }

    /**
    Removes the last char of the string
    */
    func _trimLastChar() -> String {
        if self._length > 0 {
            return self[0..<self._length-1]
        }else {
            return self
        }
    }

    /**
    Removes the first char of the string
    */
    func _trimFirstChar() -> String {
        if self._length > 0 {
            return self[1..<self._length]
        }else {
            return self
        }
    }
    
    func _toDateWithFormat(format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
    
    func _toDateUTCFormat() -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
        dateFormatter.timeZone = NSTimeZone(name: "GMT")
        return dateFormatter.dateFromString(self)
    }

    //MARK: - Arranging
    /**
    Joins two or more strings, and returns a new joined string
    */
    func _concat(string:String) -> String? {
        return self+string
    }

    /**
    Reverses the string
    */
    func _reverse() -> String {
        var reversed = ""
        for var i = self._length-1; i>=0 ;i-- {
            let char : String = self[i]
            reversed += char
        }
        return reversed
    }

    /**
    Separates string into an array of characters
    */
    func _toCharArray() -> [Character] {

        var chars : [Character] = []
        for c in self.characters {
            chars.append(c as Character)
        }

        return chars
    }

    /// Localized string
    static func _localizedString(key:String) -> String {
        let localized = NSLocalizedString(key, comment: "")

        return localized
    }

    //MARK: - Sizing
    /// returns size of string with a font
    func _sizeWithFont(font:UIFont) -> CGSize {
        let label = UILabel()
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.size
    }

    //MARK: - Sizing
    /// returns size of string with a font
    func _sizeWithFont(font:UIFont, maxWidth width:CGFloat) -> CGSize {

        let label = UILabel(frame: CGRectMake(0, 0, width, 0))
        label.numberOfLines = 0
        label.text = self
        label.font = font

        let maxSize = CGSizeMake(width, CGFloat.max)
        let requiredSize = label.sizeThatFits(maxSize)

        return requiredSize
    }

    /*
    Returns true if string is a valid email address.
    Uses regex: [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}

    :param: allowEmptyEmail - If true will allow emails of length 0
    */
    func _isValidEmail(allowEmptyEmail allowEmptyEmail:Bool) -> Bool {

        let e = self._trim()

        //allow empty email
        if allowEmptyEmail && e._length == 0 {
            return true
        }

        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let matches = e._matchesForRegex(regex)
        return matches.count > 0
    }

    ///Returns true if length == 0
    func _isEmpty() -> Bool {
        return self._length == 0
    }
    
}

public func - (string:String, subString:String) -> String {
    return string._removeString(subString)!
}













