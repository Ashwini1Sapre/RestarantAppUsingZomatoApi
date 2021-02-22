//
//  RestaurantSListROW VIEW.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI

struct RestaurantSListROW_VIEW: View {
    
    var retsurant: Restarant
    @State private var isAnimating = true
  
    var body: some View {
        
        RestaurantLisyImageView(url:
                                    URL(string: retsurant.fetured_image) ??
                                    URL(string: "https://image.flaticon.com/icons/png/128/1539/1539660.png")!, placeholder: ActivityIndicatorView(isAnimating: self.$isAnimating, style: .large)
                                        .frame(width: 100, height: 25, alignment: .center)
                                        .padding(.trailing))
        
                                VStack(alignment: .leading, spacing:20)
                                    {
                                    HStack(alignment: .center) {
                                    Text(retsurant.name)
                                        .font(.largeTitle)
                                        .padding(20)
                                    
                                
                                            
                                            
                                        Text("\(retsurant.user_Rating.aggrigateRating.stringValue ?? "3.5" )*")
                                            
                                            
                                            
                                            
                                        .background(Capsule())
                                        foregroundColor(.red)
                                            .frame(width: 55, height: 35, alignment: .center)
                                    
                                    
                                    
                                }
                                        Text(retsurant.cuisnies)
        
                                    }
        
        
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


