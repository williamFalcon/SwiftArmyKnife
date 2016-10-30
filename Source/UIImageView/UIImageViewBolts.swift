/*
UICollectionReusableView.swift
Created by William Falcon on 3/26/15.

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

public extension UIImageView {
    
    ///Init with an image name
    convenience init(_imageName:String) {
        self.init()

        let image = UIImage(named: _imageName)
        self.image = image
        
        if let im = image {
            self.frame = CGRect(origin: CGPoint.zero, size: im.size)
        }
    }

    /// Tints imageView
    func _tintWithColor(color:UIColor) {
        DispatchQueue.main.async {
            let coloredImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.image = coloredImage
            self.tintColor = color
        }
    }
    
    ///Flips an image horizontally
    func _mirrorHorizontally() {
        self.transform = transform.scaledBy(x: -1, y: 1)
    }
}
