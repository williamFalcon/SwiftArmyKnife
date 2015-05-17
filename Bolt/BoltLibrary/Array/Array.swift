/*
Bolt_Swift:
Array.swift

Created by William Falcon on 3/09/15.

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


extension Array {
    
    
    /**
    Author: William
    Finds index of an object
    
    :param: array Array to search in
    :param: object Object to find the index of
    :returns: Object object found or nil
    */
    
    func _indexOf <T: Equatable> (item: T) -> Int? {
        if item is Element {
            return Swift.find(unsafeBitCast(self, [T].self), item)
        }
        
        return nil
    }
    
    /// helps prevent out of bounds access
    func _indexInBounds(index:Int) -> Bool {
        var inBounds = (self.count-1) >= index
        return inBounds
    }
    
    // Contains an element
    func _contains <T: Equatable> (items: T...) -> Bool {
        return items._allTrue { self._indexOf($0) >= 0 }
    }
    
    func _countAsFloat() -> CGFloat {
        return CGFloat(self.count)
    }
    
    func _removeFirst() -> Array {
        var copy = self
        if !copy.isEmpty {
            copy.removeAtIndex(0)
        }
        return copy
    }
    
    /// Joins an array of strings
    func _joinWithSeparator(separator:String) -> String {
        
        var joined = String()
        for obj in self {
            var string = obj as! String
            joined = joined + string + separator
        }
        
        return joined
    }
    
    // if all found
    private func _allTrue (ele: (Element) -> Bool) -> Bool {
        for item in self {
            if !ele(item) {
                return false
            }
        }
        return true
    }
}


//MARK: - Operator Overloads

//MARK: - Insert
/**
Author: William
Operator +
Adds an element to an array


:param: elem item to add
:returns: Array with element added
*/
public func + <T>(inout array: [T], elem: T) -> [T] {
    array.append(elem)
    return array
}

/**
Author: William
Operator +=
Adds an element to an array


:param: elem item to add
:returns: Array with element added
*/
public func += <T>(inout array: [T], elem: T) -> [T] {
    array + elem
    return array
}

//MARK: - Remove
/**
Author: William
Operator -
Removes an element from an array


:param: elem item to remove
:returns: Array with element removed
*/
public func - <T:Equatable>(inout array: [T], elem: T) -> [T] {
    
    if let index = array._indexOf(elem) {
        array.removeAtIndex(index)
    }
    return array
}



/**
Author: William
Operator -=
Removes an element from an array


:param: elem item to remove
:returns: Array with element removed
*/
public func -= <T:Equatable>(inout array: [T], elem: T) -> [T] {
    array - elem
    return array
}
















