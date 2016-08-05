//
//  Set.swift
//  Testee
//
//  Created by William Falcon on 5/23/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

import Foundation

public extension Set {
    
    /**
    Returns char at an index
    Example: string[0] == "a"
    */
    subscript (index: Int) -> Element {
        //support negative indices
        var i = index
        if i < 0 {
            i = self.count - abs(index)
        }
        
        var array = _allObjects
        
        //return the requested item
        return array[i]
    }
    
    var _allObjects : Array<Element> {
        return Array(self)
    }
}
