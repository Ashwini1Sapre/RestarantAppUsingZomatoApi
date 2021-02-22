//
//  RestaurantModel.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation


struct RestaurantModel: Codable {
    
    let resultsFunds, resultsStart, resultsShown : String
    let restarunts: [Restarants]
    
    enum CodingKeys : String, CodingKey {
        
        case resultsFunds = "results_funds"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
         case restarunts
    }
    
}

struct Restarants: Codable {
    
    
    let restarunt: [Restarant]
}

struct Restarant : Codable ,Identifiable {
    
    let id ,name : String
    let url: String
    let thumb: String
    let fetured_image: String
    let user_Rating: UserRating
    let location: RestorantLocationInfo
    let cuisnies: String
    let timing: String
  
}


struct UserRating: Codable  {
   // var id: ObjectIdentifier
  
   let aggrigateRating : AggreegateRating
    let ratingText, ratingColor: String
    let votes: String
    
  
    enum CodingKeys: String, CodingKey {
        
        case aggrigateRating = "aggrigate_Rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case votes
  
    }
    
  
}


enum AggreegateRating: Codable {
    
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        if let x = try? container.decode(Int.self)
        {
            self = .integer(x)
            return
            
        }
        
        if let x = try? container.decode(String.self)
        {
            
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AggreegateRating.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "error  of wrong type"))
        
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        
        }
    }
  
    
    var stringValue: String? {
        switch self {
        case .string(let s):
            return s
        default:
            return nil
        }
     
    }
  
    var intValue: Int?
    {
        switch self {
        case .integer(let i):
            return i
        default:
            return nil
        }
    
        
    }
   
}

struct RestorantLocationInfo: Codable {
    
    let address, locality, city: String
    let cityID: Int
    let latitude, longitude, zipcode: String
    let countryID: Int
    let localityVerbose: String
    
    enum CodingKeys: String, CodingKey {
       
        case address, locality, city
        case cityID = "city_id"
        case latitude, longitude, zipcode
        case countryID = "country_id"
        case localityVerbose = "locality_verbose"
  
    }
  
    
}
