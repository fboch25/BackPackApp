//
//  SecondViewController.swift
//  BackPackApp
//
//  Created by Frank Joseph Boccia on 11/6/18.
//  Copyright © 2018 Frank Joseph Boccia. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    func showMarker(position: CLLocationCoordinate2D){
        marker.opacity = 1
        marker.isDraggable = true 
        marker.position = position
        marker.map = mapView
    }
}
extension MapViewController:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        // 4
        locationManager.startUpdatingLocation()
        
    }
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        // 7
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        // 8
        locationManager.stopUpdatingLocation()
    }
}
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D){
        marker.position = coordinate
    }
}


