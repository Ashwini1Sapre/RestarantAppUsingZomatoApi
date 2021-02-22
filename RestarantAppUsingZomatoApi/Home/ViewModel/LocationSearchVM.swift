//
//  LocationSearchVM.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import Foundation
import Combine

class LocationSearchVM: ObservableObject {
    
    @Published var city:String = ""
    @Published var dataSourse:[LocationSuggestion] = []
    
    private let ZomtaAPI = ZomatoAPI()
    private var disposal = Set<AnyCancellable>()
    
    init(scheduler: DispatchQueue = DispatchQueue(label: "LocationViewModel")) {
        
            $city
            .dropFirst(1)
            .debounce(for: .seconds(0.4), scheduler: scheduler)
            .sink(receiveValue: locationSerch(city:))
            .store(in: &disposal)
     
    }
    
    func locationSerch(city: String) {
        ZomtaAPI.LocationSearch(city: city)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else {return}
                switch value {
                case .failure:
                    self.dataSourse = []
                case .finished:
                    break
                
                }
            
            }, receiveValue: { [weak self] locationinfo in
               guard let self = self else { return }
                if (locationinfo.locationSuggestions == nil)
                {
                    self.dataSourse = []
                }
                else
                {
                    self.dataSourse = locationinfo.locationSuggestions
                    
                }
            
            }
            ).store(in: &disposal)
        
        
    }
 
    
}

