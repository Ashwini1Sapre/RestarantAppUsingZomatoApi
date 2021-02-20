//
//  RestAnnotation.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 20/02/21.
//

import Foundation
import MapKit

class RestAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(title: String, coordinate:CLLocationCoordinate2D ) {
        
        self.title = title
        self.coordinate = coordinate
        
        
    }
    
}
