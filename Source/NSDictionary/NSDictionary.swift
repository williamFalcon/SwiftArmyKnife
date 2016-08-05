//
//  NSDictionary.swift
//  Poké Prism
//
//  Created by William Falcon on 7/22/16.
//  Copyright © 2016 William Falcon. All rights reserved.
//

import UIKit


public extension NSDictionary {
    
    class func _jsonFromFileName(name:String) -> AnyObject? {

        let masterDataUrl: NSURL = NSBundle.mainBundle().URLForResource(name, withExtension: "json")!
        let jsonData: NSData = NSData(contentsOfURL: masterDataUrl)!
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
            return object
        } catch {
            // Handle Error
            print(error)
            return nil
        }
    }
}
