//
//  City.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation


struct City: Identifiable{
    
    var id: String =  UUID().uuidString
    let cityName: String
    let cityImage: String
    let cityEntityType: String
    let cityID: Int
    
    
    init(cityName: String,cityImage: String,cityEntityType: String,cityID: Int)
    {
        
        self.cityName = cityName
        self.cityImage = cityImage
        self.cityID = cityID
        self.cityEntityType = cityEntityType
        
    }
    
    
    
}
