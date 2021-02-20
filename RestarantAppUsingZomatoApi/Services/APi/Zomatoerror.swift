//
//  Zomatoerror.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 19/02/21.
//

import Foundation

enum Zomatoerror:Error {
    
    case network(description: String)
    case parsing(description: String)
}
