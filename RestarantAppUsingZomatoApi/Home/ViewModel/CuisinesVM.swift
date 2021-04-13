//
//  CuisinesVM.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import Foundation

struct CuisinesVM {
    
    static func Cuisines1() -> [Cuisines] {
        
        let pizza = Cuisines(cuisinesName: "Pizza", cuisnesImage: "pizza")
        let inaidan = Cuisines(cuisinesName: "Indian", cuisnesImage: "samosa")
        let dessert = Cuisines(cuisinesName: "Dessert", cuisnesImage: "cake-pop")
        let all = Cuisines(cuisinesName: "See All", cuisnesImage: "cutlery")
        return[pizza,inaidan,dessert,all]
    
    }
    
}
