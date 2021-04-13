//
//  RestaurantLisyImageView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI

struct RestaurantLisyImageView<Placeholer: View>: View {
    
    @ObservedObject private var loader:ImageLoader
    private let placeholder:Placeholer?
    init(url:URL, placeholder: Placeholer? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        
        Group{
            if loader.image != nil{
                Image(uiImage: loader.image!)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Rectangle())
                .cornerRadius(10.0)
                .padding(.trailing)
            }else{
                placeholder
            }
            
        }
      
        
    }
    
    
}

