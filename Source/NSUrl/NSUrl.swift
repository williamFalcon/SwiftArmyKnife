//
//  NSUrl.swift
//  Testee
//
//  Created by William Falcon on 7/15/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

import Foundation

public extension NSURL {
    
    func _parameters() -> NSDictionary? {
        
        let dict = NSMutableDictionary()
        
        if let components = query?.componentsSeparatedByString("&") {
            for comp in components {
                var sub = comp.componentsSeparatedByString("=")
                dict.setObject(sub[1], forKey: sub[0])
            }
        }
        
        return dict
    }
}