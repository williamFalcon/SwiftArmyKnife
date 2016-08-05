//
//  MKMapView.swift
//  Pokecast
//
//  Created by William Falcon on 7/17/16.
//  Copyright © 2016 William Falcon. All rights reserved.
//

import UIKit
import MapKit

extension MKMapView {
    
    func _mapWidthInMeters() -> CLLocationDistance {
        let deltaLon = self.region.span.longitudeDelta
        let latCircumference = 40075160 * cos(self.region.center.latitude * M_PI / 180)
        return deltaLon * latCircumference / 360
    }
    
    func _getZoom() -> Double {
        
        // function returns current zoom of the map
        var angleCamera = self.camera.heading
        if angleCamera > 270 {
            angleCamera = 360 - angleCamera
        } else if angleCamera > 90 {
            angleCamera = fabs(angleCamera - 180)
        }
        let angleRad = M_PI * angleCamera / 180 // camera heading in radians
        let width = Double(self.frame.size.width)
        let height = Double(self.frame.size.height)
        let heightOffset : Double = 20 // the offset (status bar height) which is taken by MapKit into consideration to calculate visible area height
        // calculating Longitude span corresponding to normal (non-rotated) width
        let spanStraight = width * self.region.span.longitudeDelta / (width * cos(angleRad) + (height - heightOffset) * sin(angleRad))
        return (log2(360 * ((width / 256) / spanStraight)) + 1) - 2
    }
    
    func _scaleAnnotations(maxZoomScale:Double, maxAnnotationSize: CGFloat, minAnnotationSize: CGFloat) {
        
        for annotation in self.annotations {
            if !(annotation is MKUserLocation) {
                if let annotationView = self.viewForAnnotation(annotation){
                    self._scaleAnnotation(annotationView, maxZoomScale: maxZoomScale, maxAnnotationSize: maxAnnotationSize, minAnnotationSize: minAnnotationSize, onComplete: nil)
                }
                
            }
        }
    }
    
    func _widthInMeters() -> Double {
        let mRect: MKMapRect = self.visibleMapRect
        let eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect))
        let westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect))
        let currentDistWideInMeters = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint)
        return currentDistWideInMeters
    }
    
    func _scaleAnnotation(annotationView: MKAnnotationView , maxZoomScale:Double, maxAnnotationSize: CGFloat, minAnnotationSize: CGFloat, onComplete:(()->())?) {
        
        
        let scale = _getZoom() / maxZoomScale
        let newWidth : CGFloat = minAnnotationSize + CGFloat(scale) * (maxAnnotationSize - minAnnotationSize)
        
        var frame = annotationView.frame
        let center = annotationView.center
        
        frame.size.width = newWidth
        frame.size.height = newWidth
        
        
        GCD._dispatchMainQueue {
            annotationView.frame = frame
            annotationView.center = center
            onComplete?()
        }

    }
    
}
