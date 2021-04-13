//
//  CitiesVM.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import Foundation

struct CitiesVM {
    static func cities() -> [City] {
        
        let sydeny = City(cityName: "Sydeny", cityImage: "sydney", cityEntityType: "city", cityID: 260)
        
        let Delhi = City(cityName: "Delhi", cityImage: "delhi", cityEntityType: "city", cityID: 1)
        let Mumbai = City(cityName: "Mumbai", cityImage: "mumbai", cityEntityType: "city", cityID: 3)
        
        let newyork = City(cityName: "Newyork", cityImage: "newyork", cityEntityType: "city", cityID: 280)
        let london = City(cityName: "London", cityImage: "london", cityEntityType: "city", cityID: 61)
     
        return[sydeny,Delhi,Mumbai,london,newyork]
      
    }
 
}
