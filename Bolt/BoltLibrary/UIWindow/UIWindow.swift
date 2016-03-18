//
//  UIWindow.swift
//  Testee
//
//  Created by William Falcon on 7/15/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

import Foundation
import UIKit

//extension UIWindow {
//    
//    ///Finds current view controller on window
//    func _currentViewController() -> UIViewController? {
//        let current = _currentVC()
//        let top = _topViewController(current)
//        return top
//    }
//    
//    private func _currentVC() -> UIViewController? {
//        var currentVC : UIViewController?
//        
//        //Find current view controller
//        if let root = rootViewController {
//            if root is UITabBarController {
//                let tab = root as! UITabBarController
//                currentVC = tab.selectedViewController
//                
//                if currentVC is UINavigationController {
//                    let nav = currentVC as! UINavigationController
//                    currentVC = nav.topViewController
//                }
//            }
//        }
//        
//        return currentVC
//    }
//    
//    private func _topViewController(base: UIViewController? = (UIApplication.sharedApplication().delegate as! AppDelegate).window!.rootViewController) -> UIViewController? {
//        if let nav = base as? UINavigationController {
//            return _topViewController(nav.visibleViewController)
//        }
//        if let tab = base as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return _topViewController(selected)
//            }
//        }
//        if let presented = base?.presentedViewController {
//            return _topViewController(presented)
//        }
//        return base
//    }
//}