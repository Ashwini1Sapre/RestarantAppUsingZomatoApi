//
//  MapView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 22/02/21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  //  typealias UIViewType = <#type#>
    
    @Binding var annotation:[RestAnnotation]
   
    func makeUIView(context:Context)->MKMapView {
        
        let mapview = MKMapView(frame: .zero)
    mapview.delegate = context.coordinator
        return mapview
        
    
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        uiView.showAnnotations(annotation, animated: true)
        
        uiView.addAnnotations(annotation)
        
    }
    
   
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
  
}

class Coordinator: NSObject, MKMapViewDelegate {
    
    var parent:MapView
    
    init(_ parent:MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let amnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Rsstaurant")
        amnnotationView.canShowCallout = true
        amnnotationView.displayPriority = .required
        amnnotationView.image = UIImage(named: "mappin")
        return amnnotationView
    }
    
    
}
    
    
    
