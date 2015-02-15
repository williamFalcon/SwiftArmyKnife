//
//  JString.swift
//
//  Created by William Falcon on 2/15/15.
//  Copyright (c) 2015 HarlemAppCollective. All rights reserved.
//
/*
The MIT License (MIT)

Copyright (c) 2015 William Falcon

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

/*
JString for swift provides many of the convenience methods from javascript (and some from python).
*/
extension String {
    
    /**
    Returns length of the string
    */
    var length: Int {
        get {
            return countElements(self)
        }
    }
    
    //MARK: Subscripting
    /**
    Returns char at an index
    Example: string[0] == "a"
    */
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
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
    Example: string["ab"]
    */
    subscript (string: String) -> Int {
        return indexOf(string)!
    }
    
    /**
    Returns string in a range
    Example: string[0...2] == "abc"
    */
    subscript (range: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, range.startIndex), end: advance(startIndex, range.endIndex)))
    }
    
    //MARK: - Searching
    /**
    Searches a string for a match against a regular expression, and returns the matches
    */
    func matchesForRegex(regex: String) -> [String] {
        
        var results : [String] = []
        var regex = NSRegularExpression(pattern: regex, options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
        if let matches = regex?.matchesInString(self, options: nil, range: NSMakeRange(0, self.length)) {
            for m in matches {
                var match = self[m.range.location..<m.range.location+m.range.length]
                results.append(match)
            }
        }
        return results
    }
    
    /**
    Searches a string for a specified value, or regular expression, and returns the position of the match
    */
    func search(string:String?) -> Int? {
        var result : Int?
        if let match = self.indexOf(string) {
            result = match
        }
        return result
    }
    
    /**
    Returns true if string contains input string
    */
    func contains(s: String) -> Bool{
        return (self.rangeOfString(s) != nil) ? true : false
    }
    
    /**
    Returns the character at the specified index (position)
    */
    func charAt(index:Int?) -> String? {
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
    func indexOf(string: String?) -> Int? {
        var result: Int?
        if let s = string {
            var range = self.rangeOfString(s)!
            result = distance(self.startIndex, range.startIndex)
        }
        return result
    }
    
    /**
    Returns the position of the last found occurrence of a specified value in a string
    */
    func lastIndexOf(string: String?) -> Int? {
        var index : Int?
        if let s = string {
            var startingIndex = self.length - s.length
            
            //return nil if input string is larger than self
            if startingIndex < 0 {
                return nil
            }
            
            //iterate from the end until we find a match in the string
            //when found, break
            for (var i = startingIndex; i>=0; i--){
                var subString = self.substringFromIndex(i)!
                if subString.contains(s) {
                    index = i
                    break
                }
            }
        }
        return index
    }
    
    //MARK: - Substrings
    /**
    Extracts the characters from a string, after a specified index
    */
    func substringFromIndex (index:Int) -> String? {
        var substring : String?
        if index <= self.length && index >= 0 {
            substring = self.substringFromIndex(advance(self.startIndex, index))
        }
        return substring
    }
    
    /**
    Extracts the characters from a string, before a specified index
    */
    func substringToIndex(index:Int) -> String? {
        
        var substring : String?
        if index <= self.length && index >= 0 {
            substring = self.substringToIndex(advance(self.startIndex, index))
        }
        return substring
    }
    
    /**
    Extracts a part of a string and returns a new string
    */
    func substringFromIndex(index:Int, toIndex to:Int) -> String {
        return self[index...to]
    }
    
    /**
    Extracts a part of a string and returns a new string
    */
    func slice(start: Int, end: Int) -> String {
        return self[start...end]
    }
    
    /**
    Splits a string into an array of substrings
    */
    func splitOn(separator: String) -> [String] {
        var results = self.componentsSeparatedByString(separator)
        return results
    }
    
    /**
    Extracts a part of a string and returns a new string starting at an index and
    going for the length requested
    */
    func substringFromIndex(index:Int, length:Int) -> String {
        return self[index...(index+length)]
    }
    
    //MARK: - Formatting
    
    /**
    Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced. Can take in an regular expression
    */
    func replaceAll(regex: String?, replacement:String?) -> String {
        
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
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    /**
    Removes the last char of the string
    */
    func trimLastChar() -> String {
        if self.length > 1 {
            return self[0..<self.length-1]
        }else {
            return self
        }
    }
    
    /**
    Removes the first char of the string
    */
    func trimFirstChar() -> String {
        if self.length > 0 {
            return self[1..<self.length]
        }else {
            return self
        }
    }
    
    //MARK: - Arranging
    /**
    Joins two or more strings, and returns a new joined string
    */
    func concat(string:String) -> String? {
        return self+string
    }
    
    /**
    Reverses the string
    */
    func reverse() -> String {
        var reversed = ""
        for var i = self.length-1; i>=0 ;i-- {
            var char : String = self[i]
            reversed += char
        }
        return reversed
    }
}















