//
//  HomeView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 23/02/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: LocationSearchVM
    @ObservedObject var locationViewModel: UserLocationVM
    @ObservedObject var locationmanager = LocationManager()
    
    @State var isOpen: Bool = false
   
    
    init(viewModel: LocationSearchVM,locationViewModel: UserLocationVM) {
        self.viewModel = viewModel
        self.locationViewModel = locationViewModel
    }
    var userLatitude: String {
        return "\(locationmanager.lastStatus?.coordinate.latitude ?? 0)"
    }
   
    var userLongitude: String {
        return "\(locationmanager.lastStatus?.coordinate.longitude ?? 0)"
        
    }
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                    .frame(height: 20)
                TextField("Enter Location",text: $viewModel.city)
                    .frame(height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.leading,.trailing])
                    .cornerRadius(10.0)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.leading,.trailing])
                Divider()
                
                VStack(alignment: .center) {
                    
                    if (viewModel.dataSourse.isEmpty) {
                        
                        CuisinesUI(latitude: Double(self.userLatitude)!, longitude: Double(self.userLongitude)!, title: locationViewModel.UserLocaity)
                        Divider()
                        CitiesView()
                        
                     
                    }
                    else if (viewModel.city == "")
                    {
                        
                        
                        CuisinesUI(latitude: Double(self.userLatitude)!, longitude: Double(self.userLongitude)!, title: locationViewModel.UserLocaity)
                        
                        Divider()
                        CitiesView()
                        
                   
                    }else{
                        
                        List{
                            
                            Section(header: ListHeader()){
                                ForEach(self.viewModel.dataSourse, id: \ .entityID){city in
                                    
                                    NavigationLink(
                                        destination: RestaurantListView(restListVM: RestaruntVM(entityID: city.entityID, entityType: city.entityType), city: city.title)) {
                                        
                                        Text(city.title)
                                        
                                    }
                                       
                                   
                                    
                                }
                               
                                
                                }
                           
                                
                            }
                            
                          
                            
                        }
                        Spacer()
                            .navigationBarTitle("DessertShow",displayMode: .inline)
                        
                     
                    }
                  
                }
              
        }.onAppear{
            
            self.locationViewModel.fetchUserLocationInfo(lat: 19.0760, lon: 72.8777)
            
            
            
            
        }
            
            
            
            
            
            
            
        }
    }
    
    
    struct ListHeader: View {
        
        var body: some View {
            HStack {
                
                Image(systemName: "map")
                Text("SERACHED Location..")
                
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: LocationSearchVM(), locationViewModel: UserLocationVM())
    }
}
