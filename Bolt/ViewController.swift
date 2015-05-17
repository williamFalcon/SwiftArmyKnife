//
//  ViewController.swift
//  Bolt
//
//  Created by William Falcon on 2/18/15.
//  Copyright (c) 2015 WilliamFalcon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var obj = Beer();
        obj.name = "will"
        obj.life = "sugar"
        
        var obj2 = ["will":"sugar"];
        
        var arr = [obj, obj2]
        print(arr._contains(obj))        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

        
        // Dispose of any resources that can be recreated.
    }


}

class Beer : NSObject {
    
    var name : String!
    var life : String!
}

