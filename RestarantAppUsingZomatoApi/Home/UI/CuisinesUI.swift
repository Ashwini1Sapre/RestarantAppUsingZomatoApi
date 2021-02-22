//
//  Cuisines.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI

struct CuisinesUI: View {
    let cuisines = CuisinesVM.Cuisines1()
    
    
    let latitude: Double
    let  longitude: Double
    let title: String
    var body: some View {
       Text("Explore Cusines\(title)")
        .bold()
        .font(.system(size: 12))
        
        VStack(spacing: 20){
            
            ForEach(cuisines){ cuisnie in
                
                VStack(spacing: 20){
                    
        NavigationLink(destination: RestaurantListView(restListVM: RestaruntVM(q: cuisnie.cuisinesName,
                                                                               lat: self.latitude,                 lon: self.longitude),
                                                                               city:
                                                                                self.title                                                )){
            Image(cuisnie.cuisnesImage)
            
                .renderingMode(.original)
                .resizable()
                .frame(width: 80, height: 80)
        }
                    
                    Text(cuisnie.cuisinesName)
                        .bold()
                    
                    
                    
                    
                }
                
                
                
                
                
                
            }
            
            
            
            
            
            
        }.padding()
        
        
        
        
        
    }
}

struct Cuisines_Previews: PreviewProvider {
    static var previews: some View {
        CuisinesUI(latitude: -33.500 , longitude: -71.400 ,title: "Pizza" )
    }
}
