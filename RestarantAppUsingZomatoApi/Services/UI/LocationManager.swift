//
//  LocationManager.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 20/02/21.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
  private let locationManger =  CLLocationManager()
    
  
    override init() {
        super.init()
        self.locationManger.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManger.delegate = self
        self.locationManger.requestAlwaysAuthorization()
        self.locationManger.requestWhenInUseAuthorization()
        self.locationManger.stopUpdatingLocation()
        
    }
    
    @Published var locationStatus: CLAuthorizationStatus?  {
        willSet {
         objectWillChange.send()
        }
      }
    
    @Published var lastStatus: CLLocation? {
      willSet {
            objectWillChange.send()
        }
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return  "unknown"
        }
        switch status {
        case .notDetermined:
            return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways : return "authorizedAlways"
        case .denied : return "denied"
        case .restricted : return "restricted"
            
        default:
            return"unknown"
        }
        
        }
    
}


extension LocationManager : CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.lastStatus = location
        self.locationManger.delegate = self
        self.locationManger.stopUpdatingLocation()
        
        print("\(location)")
        
    }
   
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error.localizedDescription)")
    }
 
}
