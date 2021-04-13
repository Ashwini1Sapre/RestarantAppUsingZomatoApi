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
        VStack{
        Text("Explore Cusines\(title)")
            
            
        .bold()
        .font(.system(size: 12))
            Text("Explore Cusines\(latitude)")
            Text("Explore Cusines\(longitude)")
                .font(.system(size: 8))
            ScrollView(.horizontal, showsIndicators: false){
        HStack(spacing: 20){
            
            ForEach(cuisines){ cuisnie in
                
                VStack(spacing: 10){
                    
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
                    
                    Print("value of lat ",self.latitude)
                    Print("value of lomg",self.longitude)
                    
                    Print("value of caption",self.title)
                }
                
               
                
                
                
                
            }
            
            
            
            
            
            
        }.padding()
            }
        
        
        }
        
        
    }
}


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct Cuisines_Previews: PreviewProvider {
    static var previews: some View {
        CuisinesUI(latitude: -33.500 , longitude: 150.435 ,title: "Pizza" )
    }
}
