/*
 Int.swift
 Created by William Falcon on 2/15/15.
 
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

import UIKit
import CoreData

public extension NSManagedObject {
  
  /**
   Create in a desired MOC or as an unassociated object
   
   - parameter managedObjectContext: MOC in charge of this object
   
   - returns: New NSManagedObject
   */
//  public convenience init(_managedObjectContext moc: NSManagedObjectContext, _dissasociated dissasociated: Bool) {
//    
//    let entityName = NSStringFromClass(type(of: self) as AnyClass).components(separatedBy: ".")[0]
//    let entity = NSEntityDescription.entity(forEntityName: entityName, in: moc)!
//    
//    //init in a MOC if given but otherwise create a dissasociated object
//    self(entity: entity, insertInto: dissasociated ? nil : moc)
//  }
  
  
  
}
