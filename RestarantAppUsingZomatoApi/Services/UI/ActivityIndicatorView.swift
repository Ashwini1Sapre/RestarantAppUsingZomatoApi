//
//  ActivityIndicatorView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 20/02/21.
//


import SwiftUI


struct ActivityIndicatorView: UIViewRepresentable {
   
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
       
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        
    }
    
    
}


struct CustumActivityIndicator: View {
    
    let loadingText:String
    var body: some View {
        
        GeometryReader { geomerty in
            
            VStack(alignment: .center){
                
                ActivityIndicatorView(isAnimating: .constant(true), style: .large)
                Text(self.loadingText)
              
            }
            .frame(width: geomerty.size.width / 2, height: geomerty.size.height / 5)
            .background(Color.gray)
            .foregroundColor(Color.primary)
            .cornerRadius(3.5)
            .opacity(1)
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


