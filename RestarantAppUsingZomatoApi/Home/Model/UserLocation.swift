//
//  UserLocation.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation

struct UserLocation: Codable {
    let location: Location
    
    enum CodigKeys: String, CodingKey {
        case location
        
    }
    
    
    
}


struct Location: Codable {
    
    let entityType: String
    let entityID: Int
    let title, latitude, longitude: String
    let cityID: Int
    let cityName: String
    let countryID: Int
    let countryName: String
    
    enum CodingKeys: String, CodingKey {
        
       case entityType = "entity_type"
        case entityID = "entity_id"
        case title, latitude, longitude
        case cityID = "city_id"
        case cityName = "city_name"
        case countryID = "country_id"
        case countryName = "country_name"
        
        
        
        
    }
    
    
    
    
}
