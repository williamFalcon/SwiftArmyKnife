//
//  JString.swift
//
//  Created by William Falcon on 2/15/15.
//  Copyright (c) 2015 HarlemAppCollective. All rights reserved.
//

import Foundation

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
    Example: string[0] == "a"
    */
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
    
    /**
    Example: string[0] == "a"
    */
    subscript (index: Int) -> String {
        return String(self[index] as Character)
    }
    
    /**
    Example: string[0...2] == "abc"
    */
    subscript (range: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, range.startIndex), end: advance(startIndex, range.endIndex)))
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
    
    /**
    Joins two or more strings, and returns a new joined string
    */
    func concat(string:String) -> String? {
        return self+string
    }
    
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
    
    /*
    
    func match(regex: String) -> [String] {
    
    }
    
    
    func search(string:String) -> String {
    
    }
    
    func slice(start: Int, end: Int) -> String {
    
    }
    
    func splitOn(separator: String) -> [String] {
    
    }
    
    func substring(fromIndex from:Int, length:Int) -> String {
    
    }
    
    func substring(fromIndex from:Int, toIndex to:Int) -> String {
    
    }
    
    
    */
}















