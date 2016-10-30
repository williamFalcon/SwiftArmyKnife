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
        
        return self[self.index(self.startIndex, offsetBy: i)]
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
        return _indexOf(string: string)!
    }

    /**
    Returns string in a range
    Example: string[0...2] == "abc"
    */
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }

    //MARK: - Searching
    /**
    Searches a string for a match against a regular expression, and returns the matches
    */
    func _matchesForRegex(regex: String) -> [String] {

        var results : [String] = []
        let regex = try? NSRegularExpression(pattern: regex, options: NSRegularExpression.Options.caseInsensitive)
        if let matches = regex?.matches(in: self, options: [], range: NSMakeRange(0, self._length)) {
            for m in matches {
                let match = self[m.range.location..<m.range.location+m.range.length]
                results.append(match)
            }
        }
        return results
    }

    subscript (range: Range<Int>) -> String {
        
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.count)
        
        return self[startIndex..<endIndex]
    }
    
    /**
    Searches a string for a specified value, or regular expression, and returns the position of the match
    */
    func _search(string:String?) -> Int? {
        var result : Int?
        if let match = self._indexOf(string: string) {
            result = match
        }
        return result
    }

    /**
    Searches a string for a specified value, or regular expression, and returns the position of the match
    */
    func _containsRegex(string:String?) -> Bool {
        return _matchesForRegex(regex: string!).count > 0
    }

    /**
    Returns true if string contains input string
    */
    func _contains(s: String) -> Bool{
        return (self.range(of: s) != nil) ? true : false
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
            if let range = self._rangeOfString(sub: s) {
                result = range.lowerBound
            }
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
            for i in stride(from:self._length-1, to: 0, by: -1) {
                let subString = self._substringFromIndex(index: i)!
                if subString._contains(s: s) {
                    index = i
                    break
                }
            }
        }
        return index
    }


    func _rangeOfString(sub:String) -> ClosedRange<Int>? {

        if let start = self._indexOf(string: sub) {
            return ClosedRange(start..<sub._length)
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
            let index = self.index(self.startIndex, offsetBy: index)
            substring = self.substring(from:  index)
        }
        return substring
    }

    /**
    Extracts the characters from a string, before a specified index
    */
    func _substringToIndex(index:Int) -> String? {

        var substring : String?
        if index <= self._length && index >= 0 {
            let index = self.index(self.startIndex, offsetBy: index)
            substring = self.substring(to:  index)
        }
        return substring
    }

    /// Extracts the characters from a string
    func _removeString(str:String) -> String? {

        let substr = self._replaceAll(regex: str, replacement: "")
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
        let results = self.components(separatedBy: separator)
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
                result = replacingOccurrences(of: r, with: rep, options: .regularExpression, range: nil)
            }
        }

        return result
    }

    /**
    Removes whitespace from both ends of a string
    */
    func _trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

    /**
    Removes the last char of the string
    */
    func _trimLastChar() -> String {
        if self._length > 0 {
            return self._substringToIndex(index: self._length - 1)!
        }else {
            return self
        }
    }

    /**
    Removes the first char of the string
    */
    func _trimFirstChar() -> String {
        if self._length > 0 {
            return self._substringFromIndex(index: 1)!
        }else {
            return self
        }
    }
    
    func _toDateWithFormat(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) as Date?
    }
    
    func _toDateUTCFormat() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
        dateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone!
        return dateFormatter.date(from: self) as Date?
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
        for i in stride(from:self._length-1, to: 0, by: -1) {
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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        
        
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let requiredSize = label.sizeThatFits(maxSize)

        return requiredSize
    }

    /*
    Returns true if string is a valid email address.
    Uses regex: [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}

    :param: allowEmptyEmail - If true will allow emails of length 0
    */
    func _isValidEmail(allowEmptyEmail:Bool) -> Bool {

        let e = self._trim()

        //allow empty email
        if allowEmptyEmail && e._length == 0 {
            return true
        }

        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let matches = e._matchesForRegex(regex: regex)
        return matches.count > 0
    }

    ///Returns true if length == 0
    func _isEmpty() -> Bool {
        return self._length == 0
    }
    
}

public func - (string:String, subString:String) -> String {
    return string._removeString(str: subString)!
}













