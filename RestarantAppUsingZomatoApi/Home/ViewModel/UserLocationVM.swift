//
//  UserLocationVM.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import Foundation
import Combine

class UserLocationVM: ObservableObject {
    
    @Published var UserLocaity:String = ""
    private let zomtaAPI = ZomatoAPI()
    private var currentLocationcancanllabel: AnyCancellable?
    
    func fetchUserLocationInfo(lat:Double, lon:Double) {
        
        currentLocationcancanllabel = zomtaAPI.fetchUserLocation(lat: 19.0760, log: 72.8777)
        
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self]  value in
                guard let self = self else { return }
               
                switch value {
                case .failure:
                    self.UserLocaity = ""
                
                case .finished:
                    break
                
                }
                
                }, receiveValue: { [weak self] locationInfo in
                    
                    guard let self = self else { return }
                    
                    self.UserLocaity = locationInfo.location.title
                    
                
                
                
                
            })
        
        
        
    }
    
    
    
    
    
    
    
}
