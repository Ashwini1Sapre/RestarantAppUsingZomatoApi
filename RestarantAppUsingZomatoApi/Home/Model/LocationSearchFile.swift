//
//  LocationSearchFile.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation
struct LocationSearchFile: Codable {
    
    let locationSuggestions: [LocationSuggestion]
    let status: String?
    let hasMore, hasTotal: Int?
    let userHasAddresses: Bool?
    
    enum CodingKeys: String,CodingKey
    {
        case locationSuggestions = "location_suggestions"
        case status
        case hasMore = "has_more"
        case hasTotal = "has_total"
        case userHasAddresses = "user_has_addresses"
        
        
        
    }
    
    
    
    
    
}


struct LocationSuggestion: Codable {
    
    let entityType: String
    let entityID: Int
    let title: String
    let latitude, longitude: Double
    let cityID: Int
    let cityName: String
    let countryID: Int
    let countryName: String
        
    enum CodingKeys: String,CodingKey {
        
        case entityType = "entity_type"
        case entityID = "entity_id"
        case title,latitude,longitude
        case cityID = "city_id"
        case cityName = "city_name"
        case countryID = "country_id"
        case countryName = "country_name"
        
        
        
        
        
    }
    
    
    
    
    
}
