//
//  RootKmlParser.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 02/10/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import Foundation

class KmlDocumentParser : NSObject, NSXMLParserDelegate {
    let onFinish: ([KmlPlacemark]) -> ()
    
    var placemarks : [KmlPlacemark] = []
    var currentSubparser: NSXMLParserDelegate?
    
    init(onFinish: ([KmlPlacemark]) -> ()) {
        self.onFinish = onFinish
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String, qualifiedName qName: String, attributes attributeDict: [NSObject : AnyObject]) {
        if elementName == "Placemark" {
            self.currentSubparser = KmlPlacemarkParser({ (placemark) -> () in
                self.placemarks.append(placemark)
            })
            
            parser.delegate = self.currentSubparser
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String, qualifiedName qName: String) {
        if elementName == "Document" {
            self.onFinish(placemarks)
        }
        else {
            // Oops...
            println("Error parsing the KML file")
        }
    }
}