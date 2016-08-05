/*
UICollectionReusableView.swift
Created by William Falcon on 4/1/15.

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

public extension UICollectionView {
    
    /// Maximizes the height of a cell
    func _maxCellHeightForItemsCount(count:NSInteger, maxWidth width:CGFloat) -> CGFloat {
        
        let count : CGFloat = CGFloat(count)
        let contentSize = self.bounds
        let maxRowItems = floor(contentSize.width/width)
        let rows =  ceil(count / maxRowItems)
        let cellHeight = contentSize.height/rows
        
        return cellHeight
    }
    
    ///Scrolls to a section at the given indexpath
    func _scrollToSectionAtIndex(indexPath:NSIndexPath, animated:Bool) {
        
        let offsetY : CGFloat = self.layoutAttributesForSupplementaryElementOfKind(UICollectionElementKindSectionHeader , atIndexPath: indexPath)!.frame.origin.y
        let contentInsetY : CGFloat = self.contentInset.top
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInsetY : CGFloat = layout.sectionInset.top
        
        self.setContentOffset(CGPoint(x: self.contentOffset.x, y: offsetY-contentInsetY-sectionInsetY), animated: animated)
    }
    
    ///Scrolls to a section at the given index
    func _scrollToSectionAtIndex(indexPath:NSIndexPath, withAddedOffset addedOffset:CGPoint, animated:Bool) {
        
        let offsetY : CGFloat = self.layoutAttributesForSupplementaryElementOfKind(UICollectionElementKindSectionHeader , atIndexPath: indexPath)!.frame.origin.y
        let contentInsetY : CGFloat = self.contentInset.top
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInsetY : CGFloat = layout.sectionInset.top
        
        self.setContentOffset(CGPoint(x: self.contentOffset.x + addedOffset.x, y:( offsetY-contentInsetY-sectionInsetY) + addedOffset.y), animated: animated)
    }
}