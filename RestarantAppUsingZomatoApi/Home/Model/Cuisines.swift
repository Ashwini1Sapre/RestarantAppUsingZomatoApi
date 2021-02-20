//
//  Cuisines.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation


struct Cuisines: Codable{
    
    var id: String = UUID().uuidString
    let cuisinesName: String
    let cuisnesImage: String
    
    
    init(cuisinesName: String, cuisnesImage: String ) {
       
        self.cuisinesName = cuisinesName
        self.cuisnesImage = cuisnesImage
        
    }
    
    
}
