//
//  StoreProvider.swift
//  MapViewSample
//
//  Created by School on 16/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import Foundation


public protocol StoreProvider: class {
    
    var stores: [Store] { get }
    
}
