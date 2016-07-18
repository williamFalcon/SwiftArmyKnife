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
    
}
