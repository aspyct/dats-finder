//
//  StationProvider.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 30/09/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import Foundation

class StationProvider {
    func listAllStations() -> Array<FuelStation> {
        if let fileUrl = NSBundle.mainBundle().URLForResource("stations", withExtension: "json") {
            let data = NSData.dataWithContentsOfURL(fileUrl, options: nil, error: nil) as NSData
            let jsonArray = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as [[String: AnyObject]]
            
            let allFuelStations = map(jsonArray, { (let jsonObject : [String: AnyObject]) -> FuelStation in
                var fuelStation = FuelStation()
                
                if let name: AnyObject = jsonObject["name"] {
                    if let stringName = name as? String {
                        fuelStation.name = stringName
                    }
                }
                
                fuelStation.longitude = (jsonObject["longitude"] as NSNumber).doubleValue
                fuelStation.latitude = (jsonObject["latitude"] as NSNumber).doubleValue

                return fuelStation
            })
            
            return allFuelStations
        }
        else {
            return []
        }
    }
}