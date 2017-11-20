//
//  MapViewController.swift
//  MapViewSample
//
//  Created by School on 15/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

   
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager!
    
    weak var storeProvider: StoreProvider?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        if CLLocationManager.locationServicesEnabled(){
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
            self.locationManager = manager
        }
    
        /*
        let opera = MKPointAnnotation()
        opera.coordinate  = .init(latitude: 48.8725125, longitude: 3.3311423)
        opera.title  = "Apple Store"
        opera.subtitle = "Ouverture 8h-22h"
        
        
        let louvres = MKPointAnnotation()
        louvres.coordinate = .init(latitude: 48.8629555, longitude: 2.3322693)
        louvres.title = "Louvres Apple Store"
        louvres.subtitle = "Ouverture 8h-22h"
        
        self.mapView.addAnnotations([opera, louvres])
     */
     }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.mapView.removeAnnotations(self.mapView.annotations)
        
            if let stores = self.storeProvider?.stores {
                self.mapView.addAnnotations(stores.map { $0.annotion })
            }
    }

}

extension MapViewController : MKMapViewDelegate {
    public static let appleStoreIdentifier = "ASI"
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if(annotation is MKUserLocation){
            return nil
        }
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: MapViewController.appleStoreIdentifier)
        if let reused = view {
            reused.annotation = annotation
            return reused
        }
        
        let pin = MKPinAnnotationView(annotation : annotation, reuseIdentifier: MapViewController.appleStoreIdentifier )
        pin.canShowCallout = true
        pin.pinTintColor = UIColor.blue
        return pin
    
    }

}

extension Store {
    public var annotion : MKAnnotation {
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = self.name
        pointAnnotation.coordinate = self.coordinate
        return pointAnnotation
    }
}



