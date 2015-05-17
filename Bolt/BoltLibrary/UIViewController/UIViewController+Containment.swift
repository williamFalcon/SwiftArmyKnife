//
//  UIViewController+Containment.swift
//  TabletMobile
//
//  Created by Peng Chia on 4/8/15.
//  Copyright (c) 2015 Tablet Inc. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func removeChildViewController(childViewController: UIViewController) {
        childViewController.willMoveToParentViewController(nil)
        
        if let childView = childViewController.view {
            if let superview = childView.superview {
                childView.removeFromSuperview()
            }
        }
        
        if let parent = childViewController.parentViewController {
            childViewController.removeFromParentViewController()
        }
    }
    
    func addChildViewController(childViewController: UIViewController, toContainer containerView: UIView) {
        addChildViewController(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.didMoveToParentViewController(self)
    }
}