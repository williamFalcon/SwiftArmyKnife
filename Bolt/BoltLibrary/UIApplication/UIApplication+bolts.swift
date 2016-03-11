//
//  UIApplication+bolts.swift
//  Testee
//
//  Created by William Falcon on 3/10/16.
//  Copyright © 2016 William Falcon. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func _jumpToSettings() {
        if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(appSettings)
        }
    }
}