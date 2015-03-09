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
    func _indexOf<T: Equatable>(array: [T], valueToFind: T) -> Int? {
        for (index, value) in enumerate(array) {
            if value == valueToFind {
                return index
            }
        }
        return nil
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
    
    if let index = array._indexOf(array, valueToFind: elem) {
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
















