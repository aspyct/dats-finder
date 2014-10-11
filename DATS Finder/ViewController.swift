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
    
    let locationManager = CLLocationManager()
    let stationProvider = StationProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stationProvider.listAllStations { (station) -> () in
            let pin = MKPointAnnotation()
            
            pin.coordinate = CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude)
            pin.title = station.name
            
            self.mapView.addAnnotation(pin)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let brussels = CLLocationCoordinate2DMake(50.8500, 4.3500)
        let belgiumSpan = MKCoordinateSpanMake(5, 5)
        self.mapView.region = MKCoordinateRegionMake(brussels, belgiumSpan)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("understood")) {
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            let disclaimer = self.storyboard!.instantiateViewControllerWithIdentifier("disclaimer") as UIViewController
            self.presentViewController(disclaimer, animated: false, completion: nil)
        }
    }
}

