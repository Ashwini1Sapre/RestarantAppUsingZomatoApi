//
//  CitiesView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI

struct CitiesView: View {
    let cities = CitiesVM.cities()
    
    var body: some View {
       
        Text("Explore foods in city wise")
            .bold()
            .font(.system(size: 18))
        ScrollView(.horizontal, showsIndicators: false){
        HStack(spacing: 20){
            ForEach(cities){city in
                
                VStack(spacing:20){
                    
                  NavigationLink(
                    destination: RestaurantListView(restListVM: RestaruntVM(entityID: city.cityID, entityType: city.cityEntityType), city: city.cityName)){
                    
                    Image(city.cityImage)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle()
                                    .stroke(Color.white.opacity(0.6),lineWidth: 5))
                    
                  }
                    
                    Text(city.cityName)
                    
                        .bold()
                    
                    
                    
                    
                }
                
                
             
                
            }
            
        
            
            
        }.padding()
        
        
        
        }
        
        
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
