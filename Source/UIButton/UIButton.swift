/*
UIButton.swift
Created by William Falcon on 4/14/15.

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

extension UIButton {

    //MARK: - Tinted Button
    ///Sets image tint of an image for a state
    func _setImageTintColor(color:UIColor, forState state:UIControlState) {

        if let _ = self.imageView?.image {
            var tintedImage = self.imageForState(state)!
            tintedImage = self.tindedImage(tintedImage, withColor: color)
            self.setImage(tintedImage, forState: state)
        }else {
            print("Button does not have image to tint")
        }
    }

    ///Tints the images of an array of buttons with a color
    func _tintButtonImages(buttons:NSArray, withColor color:UIColor, forState state:UIControlState) {
        for obj in buttons {
            let button = obj as! UIButton
            button._setImageTintColor(color, forState: state)
        }
    }

    ///Sets background tint color for button
    func _setBackgroundTintColor(color:UIColor, forState state:UIControlState) {
        if let ownBackgroundImage = self.backgroundImageForState(state) {
            let tintedImage = self.tindedImage(ownBackgroundImage, withColor: color)
            self.setBackgroundImage(tintedImage, forState: state)
        }else {
            print("Button does not have an image to tint %@", self)
        }
    }

    ///Tints the background images of an array of buttons with a color
    func _tintButtonBackgrounds(buttons:NSArray, withColor color:UIColor, forState state:UIControlState) {
        for obj in buttons {
            let button = obj as! UIButton
            button._setBackgroundTintColor(color, forState: state)
        }
    }

    // Mod of @horsejockey's method:
    // http://stackoverflow.com/a/19413033
    // Originally found at https://github.com/filipstefansson/UITintedButton/blob/master/UIButton%2BtintImage.m
    private func tindedImage(image:UIImage, withColor color:UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.mainScreen().scale)

        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0, image.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)

        let rect = CGRectMake(0, 0, image.size.width, image.size.height)

        //draw alpha mask
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        CGContextDrawImage(context, rect, image.CGImage)

        // draw tint color, preserving alpha values of original image
        CGContextSetBlendMode(context, CGBlendMode.SourceIn)
        tintColor?.setFill()
        CGContextFillRect(context, rect)

        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return coloredImage
    }
}



