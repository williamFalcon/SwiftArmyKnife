/*
UIView.swift
Created by William Falcon on 4/31/15.

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

extension UIView {
    
    /// Draws a line at the top of the cell
    func _topBorder(lineWidth: CGFloat, strokeWidth:CGFloat, ofColor color:UIColor) {
        
        let startingX = (self.bounds.size.width - lineWidth)/2
        let endingX = startingX + lineWidth
        
        _drawLineFromPoint(CGPoint(x: startingX, y: 0), toPoint: CGPoint(x: endingX, y: 0), ofColor: color, strokeWidth: strokeWidth)
    }
    
    /// Draws a line at the bottom of the cell
    func _bottomBorder(lineWidth: CGFloat, strokeWidth:CGFloat, ofColor color:UIColor) {
        
        let y : CGFloat = self.frame.size.height
        let startingX = (self.bounds.size.width - lineWidth)/2
        let endingX = startingX + lineWidth
        
        _drawLineFromPoint(CGPoint(x: startingX, y: y), toPoint: CGPoint(x: endingX, y: y), ofColor: color, strokeWidth: strokeWidth)
    }
    
    /// Draws a line between two points. Stroke width is the thickness of the line
    func _drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor,strokeWidth width:CGFloat) {
        
        //design the path
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = width
        
        self.layer.addSublayer(shapeLayer)
    }
    
    ///Returns the center point of this view in its superview
    func _centerPointInSuperview() -> CGPoint {
        let x = CGRectGetMidX(self.bounds)
        let y = CGRectGetMidY(self.bounds)
        return CGPointMake(x, y)
    }
    
    /// Center point at the bottom of the view
    func _centerBottom() -> CGPoint {
        var point = self.center
        point.y += (self.bounds.height/2)
        return point
    }
    
    /// center point at the top of the view
    func _centerTop() -> CGPoint {
        var point = self.center
        point.y -= (self.bounds.height/2)
        return point
    }
    
    /// center point at the top of the view
    func _centerLeft() -> CGPoint {
        var point = self.center
        point.x -= (self.bounds.width/2)
        return point
    }
    
    /// center point at the top of the view
    func _centerRight() -> CGPoint {
        var point = self.center
        point.x += (self.bounds.width/2)
        return point
    }
    
    ///Center point inside this view
    func _innerCenter() -> CGPoint {
        let point = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        return point
    }
    
    ///Center right point inside this view
    func _innerCenterRight() -> CGPoint {
        var point = self._innerCenter()
        point.x = self.bounds.width
        return point
    }
    
    ///Center left point inside this view
    func _innerCenterLeft() -> CGPoint {
        var point = self._innerCenter()
        point.x = 0
        return point
    }
    
    ///Center top point inside this view
    func _innerCenterTop() -> CGPoint {
        var point = self._innerCenter()
        point.y = 0
        return point
    }
    
    ///Center bottom point inside this view
    func _innerCenterBottom() -> CGPoint {
        var point = self._innerCenter()
        point.y = self.bounds.height
        return point
    }
    
    ///Removes swift class identifiers and returns clean class name
    class func _className() -> String {
        return NSStringFromClass(self.classForCoder()).componentsSeparatedByString(".").last! as String
    }
}















