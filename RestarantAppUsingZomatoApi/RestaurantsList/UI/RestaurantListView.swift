//
//  RestaurantListView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI
import CoreLocation
struct RestaurantListView: View {
    @ObservedObject var restListVM: RestaruntVM
    @State private var isAnimating = true
    @State  var locationINfo = [RestAnnotation]()
    @State var isShowingMap = false
    @State var index = 0
    
    let city: String
    
    var body: some View {
        
        VStack {
            if(self.index == 0){
                if(self.restListVM.dataSourse.isEmpty){
                 CustumActivityIndicator(loadingText: "Loding.....")
                    
                    
                    
                }
                else
                {
                    List(self.restListVM.dataSourse, id: \.name){restaurants in
                        
                   
                    }
                    
                  
                }
                
            }else {
                
                MapView(annotation: $locationINfo)
                
            }
            
          
            
        }.onAppear{
            
            for i in self.restListVM.dataSourse{
                
                let lat = Double(i.location.latitude)
                let lng = Double(i.location.longitude)
                
               // self.locationINfo.append(RestAnnotation(title: i.name, coordinate: CLLocationCoordinate2D(latitude: lat ?? -33.5152, longitude: lng ?? -72.5152)))
                
               
                
                self.locationINfo.append(RestAnnotation(title: i.name, coordinate: CLLocationCoordinate2D(latitude: lat ?? -33.5152, longitude: lng ?? -71.55)))
                
                
                
              
            }
            
            
            
        }.navigationBarTitle("Demo for restaurant List")
        .navigationBarItems(trailing:
      HStack{
        Button(action: {
            withAnimation(.spring(response: 0.8,dampingFraction: 0.5,blendDuration: 0.5)){
                
                self.index = 0
            }
        
        })
        {
            Image(systemName:"list.bullet")
                .foregroundColor(self.index == 0 ? .black : .red)
                .frame(width: 40, height: 30)
      
            
        }.background(self.index == 0 ? Color.white : Color.clear)
        .clipShape(Rectangle())
        
        Button(action: {
            withAnimation(.spring(response: 0.8,
                                  dampingFraction: 0.5,blendDuration: 0.5)){
                self.index = 1
                
            }
            
        })
        {
            Image(systemName: "map")
                .foregroundColor(self.index == 1 ? .black : .white)
                .frame(width: 40, height: 30)
            
        }
        .background(self.index == 1 ? Color.white : Color.clear)
        
        .clipShape(Rectangle())
        
                              
      }.background(Color.black.opacity(0.1))
                                .clipShape(Capsule())
        
        
        
        
        
        
        
        
        
        )
        
        
        
        
        
        
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restListVM: RestaruntVM(entityID: 123, entityType: "city"), city: "Sydeny")
    }
}
