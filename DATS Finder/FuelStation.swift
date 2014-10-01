//
//  FuelStation.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 01/10/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import Foundation

class FuelStation {
    var name = ""
    var longitude = 0.0
    var latitude = 0.0
    
    var description: String {
        return "\(name) (\(longitude), \(latitude))"
    }
}