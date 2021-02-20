//
//  ImageLoader.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 20/02/21.
//

import SwiftUI
import Combine
import Foundation


class ImageLoader: ObservableObject {
  
    @Published  var image : UIImage?
   private var url: URL
    private var Cancallabel: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        Cancallabel?.cancel()
    }
    
    
    func load()
    {
        
        Cancallabel = URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data)}
            .replaceError(with: UIImage(systemName: ""))
           
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    
    
    func cancel() {
        
        
        Cancallabel?.cancel()
        
    }
    
    
    
    
}


