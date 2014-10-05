//
//  StationProvider.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 30/09/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import Foundation

class StationProvider : NSObject, NSXMLParserDelegate {
    var documentParser: KmlDocumentParser? = nil
    var parser: NSXMLParser? = nil
    
    func listAllStations(onStation: (FuelStation) -> ()) {
        if let fileUrl = NSBundle.mainBundle().URLForResource("stations", withExtension: "kml") {
            var allStations: [KmlPlacemark] = []
            let parser = NSXMLParser(contentsOfURL: fileUrl)
            self.parser = parser
            self.documentParser = KmlDocumentParser(onPlacemark: { (placemark) -> () in
                let station = FuelStation()
                
                station.name = placemark.name
                station.longitude = placemark.longitude
                station.latitude = placemark.latitude
                
                onStation(station)
            })
            
            parser.delegate = self.documentParser
            parser.parse()
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]) {
        println(elementName)
    }
}