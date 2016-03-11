//
//  UIViewController+Containment.swift
//  TabletMobile
//
//  Created by Peng Chia on 4/8/15.
//  Copyright (c) 2015 Tablet Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    
    ///Presents an alert controller with OK button
    func _presentAlertControllerWithTitle(title: String, message: String, defaultButtonTitle:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: defaultButtonTitle, style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(action)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    ///Presents an alert controller with OK button
    func _presentAlertControllerWithTitle(title: String, message: String, defaultButtonTitle:String, onButtonPress:(()->())?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)

        let action = UIAlertAction(title: defaultButtonTitle, style: UIAlertActionStyle.Default) { (action) -> Void in
            onButtonPress?()
        }

        alertController.addAction(action)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}