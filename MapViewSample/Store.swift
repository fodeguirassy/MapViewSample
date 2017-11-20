//
//  Store.swift
//  MapViewSample
//
//  Created by School on 16/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import Foundation
import CoreLocation

public class Store {
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    
    public init(name: String, coordinate : CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
    
}
