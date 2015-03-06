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

/*
String for swift provides many of the String API convenience methods from javascript (and some from python).
*/
extension String {
    
    /**
    Returns length of the string
    */
    var _length: Int {
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
        //support negative indices
        var i = index
        if i < 0 {
            i = self._length - abs(index)
        }
        
        //return the requested item
        return self[advance(self.startIndex, i)]
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
        return substringWithRange(Range(start: advance(startIndex, range.startIndex), end: advance(startIndex, range.endIndex)))
    }
    
    //MARK: - Searching
    /**
    Searches a string for a match against a regular expression, and returns the matches
    */
    func _matchesForRegex(regex: String) -> [String] {
        
        var results : [String] = []
        var regex = NSRegularExpression(pattern: regex, options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
        if let matches = regex?.matchesInString(self, options: nil, range: NSMakeRange(0, self._length)) {
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
    func _search(string:String?) -> Int? {
        var result : Int?
        if let match = self._indexOf(string) {
            result = match
        }
        return result
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
            var range = self.rangeOfString(s)!
            result = distance(self.startIndex, range.startIndex)
        }
        return result
    }
    
    /**
    Returns the position of the last found occurrence of a specified value in a string
    */
    func _lastIndexOf(string: String?) -> Int? {
        var index : Int?
        if let s = string {
            var startingIndex = self._length - s._length
            
            //return nil if input string is larger than self
            if startingIndex < 0 {
                return nil
            }
            
            //iterate from the end until we find a match in the string
            //when found, break
            for (var i = startingIndex; i>=0; i--){
                var subString = self._substringFromIndex(i)!
                if subString._contains(s) {
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
    func _substringFromIndex(index:Int) -> String? {
        var substring : String?
        if index <= self._length && index >= 0 {
            substring = self.substringFromIndex(advance(self.startIndex, index))
        }
        return substring
    }
    
    /**
    Extracts the characters from a string, before a specified index
    */
    func _substringToIndex(index:Int) -> String? {
        
        var substring : String?
        if index <= self._length && index >= 0 {
            substring = self.substringToIndex(advance(self.startIndex, index))
        }
        return substring
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
        var results = self.componentsSeparatedByString(separator)
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
            var char : String = self[i]
            reversed += char
        }
        return reversed
    }
    
    /**
    Separates string into an array of characters
    */
    func _toCharArray() -> [Character] {
        
        var chars : [Character] = []
        for c in self {
            chars.append(c as Character)
        }
        
        return chars
    }
}















