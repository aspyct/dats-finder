//
//  ViewController.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 30/09/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var fuelTypeBox: UIView!
    
    let locationManager = CLLocationManager()
    let stationProvider = StationProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for station in stationProvider.listAllStations() {
            println(station)
            
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude)
            pin.title = station.name
            mapView.addAnnotation(pin)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fuelTypeBox.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestWhenInUseAuthorization()
    }
}

