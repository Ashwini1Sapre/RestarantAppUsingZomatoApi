//
//  ZomatoAPi.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation
import Combine


class ZomatoAPI {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
   private let apiKey = "7743aea88c2d4f753465c610ef1cf5a8"
    private let baseURL = "https://developers.zomato.com/api/v2.1"
    private let header = ["Accept":"application/json", "user-key":"7743aea88c2d4f753465c610ef1cf5a8"]
    
    
    
    func fetchUserLocation(lat: Double, log: Double) -> AnyPublisher<UserLocation, Error> {
        
        let locationURl = baseURL + "geocode"
        var components = URLComponents(string: locationURl)
        components?.queryItems = [URLQueryItem(name: "lat", value: "\(lat)"),
                                  URLQueryItem (name: "log", value: "\(log)")]
         var request = URLRequest(url: (components?.url)!)
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        return session.dataTaskPublisher(for: request)
            .map{$0.data}
            .mapError{ error -> Error in
            switch error {
                
                case URLError.cannotFindHost :
                    return Zomatoerror.network(description: error.localizedDescription)
               
                default:
                    return Zomatoerror.parsing(description: error.localizedDescription)
                
                }
                }
            .receive(on: RunLoop.main)
            .decode(type: UserLocation.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    func LocationSearch(city: String) -> AnyPublisher<LocationSearchFile, Error> {
        
        let locationUrl = baseURL + "locations"
        var copmonent = URLComponents(string: locationUrl)
        copmonent?.queryItems = [URLQueryItem(name: "city", value: "\(city)")]
        
        var request = URLRequest(url:(copmonent?.url)!)
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        return session.dataTaskPublisher(for: request)
            .map{$0.data}
            .mapError{ error -> Error in
                switch error {
                
                case URLError.cannotFindHost:
                    return Zomatoerror.network(description: error.localizedDescription)
                    
                default:
                    return Zomatoerror.parsing(description: error.localizedDescription)
                
                }
             
            }
            .receive(on: RunLoop.main)
            .decode(type: LocationSearchFile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
       
    }
    
    
    
    func RestaruntListSearch(entityId: Int, entityType: String) -> AnyPublisher<RestaurantModel, Error> {
        
        let restarunturl = baseURL + "search"
        var components = URLComponents(string: restarunturl)
        components?.queryItems = [URLQueryItem(name: "entityId", value: "\(entityId)"), URLQueryItem(name: "entityType", value: "\(entityType)"), URLQueryItem(name: "count", value: "50")]
        
        
        var request = URLRequest(url: (components?.url)!)
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        return session.dataTaskPublisher(for: request)
        
            .map{$0.data}
            .mapError { error -> Error in
                switch error {
                case URLError.cannotFindHost:
                    return Zomatoerror.network(description: error.localizedDescription)
                default:
                    return Zomatoerror.parsing(description: error.localizedDescription)
            
                }
           
            }
            .receive(on: RunLoop.main)
            .decode(type: RestaurantModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        
        
    }
    
    func RestaruntLocation(q: String, lat: Double, lng: Double) -> AnyPublisher<RestaurantModel, Error> {
        
        let locurl = baseURL + "search"
        var components = URLComponents(string: locurl)
        components?.queryItems = [URLQueryItem(name: "q", value: "\(q)" ), URLQueryItem(name: "count", value: "50"), URLQueryItem(name: "lat", value: "\(lat)"), URLQueryItem(name: "lng", value: "\(lng)"), URLQueryItem(name: "sort", value: "real_distance")]
        var request = URLRequest(url: (components?.url)!)
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        return session.dataTaskPublisher(for: request)
        
            .map{$0.data}
            .mapError { error -> Error in
                switch error {
                
                case URLError.cannotFindHost :
                    return  Zomatoerror.network(description: error.localizedDescription)
              
                default:
                    return Zomatoerror.parsing(description: error.localizedDescription)
                
                }
             
            }
            .receive(on: RunLoop.main)
            .decode(type: RestaurantModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        
    }
    
    
    
    
    
    
    
}
