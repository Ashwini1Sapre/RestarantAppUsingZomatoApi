//
//  RestaruntVM.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import Foundation
import Combine

class RestaruntVM: ObservableObject {
    
    @Published var dataSourse:[Restarant] = []
    
    private let zomatoApi = ZomatoAPI()
    private var restaruntcancallable: AnyCancellable?
    
    init(entityID: Int, entityType: String) {
       
        restaruntcancallable = zomatoApi.RestaruntListSearch(entityId: entityID, entityType: entityType)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                
                guard let self = self else { return }
                
                switch value {
                
                
                case .failure:
                    
                    self.dataSourse = []
                    
                
                case .finished:
                    break
               
                }
                
            }, receiveValue: { [weak self] restaurants in
                
                guard let self = self else { return }
                
                self.dataSourse = (restaurants.restarunts.map({$0.restarunt})) as! [Restarant]
               
            })
        
    }
    
    
    init(q:String, lat: Double, lon: Double) {
        
        restaruntcancallable = zomatoApi.RestaruntLocation(q: q, lat: lat, lng: lon)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                
                guard let self = self else { return }
                switch value {
                
                case .failure:
                    self.dataSourse = []
                
                case .finished:
                    break
                }
                
                
                
            }, receiveValue: { [weak self] restaurants in
                
                guard let self = self else { return }
               // self.dataSourse = (restarunt1.restarunts.map({$0.restarunt})) as! [Restarant]
                
                self.dataSourse = (restaurants.restarunts.map({$0.restarunt})) as! [Restarant]
                
            })
        
        
        
    }
    
    
    
    
    
    
    
    
}
