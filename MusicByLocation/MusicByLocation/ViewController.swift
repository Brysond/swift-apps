//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Bryson, David (IRG) on 26/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }


    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    self.musicRecommendations.text = """
                    City: \(placemarks?[0].locality ?? "No City Found")
                    County: \(placemarks?[0].subAdministrativeArea ?? "No County found")
                    State/Province: \(placemarks?[0].administrativeArea ?? "No State or Province found")
                    Country: \(placemarks?[0].country ?? "No Country Found")
                    Country Code: \(placemarks?[0].isoCountryCode ?? "No country code found")
                    Nearby landmarks: \(placemarks?[0].areasOfInterest ?? ["This location is distinctly un-interesting"])
                    """
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's locaton. Error: \(error.localizedDescription)"
    }
}

