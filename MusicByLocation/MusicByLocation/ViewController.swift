//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Bryson, David (IRG) on 26/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit
import CoreLocation


/*
 - Outlet
 - Action
 - Requesting location
 - Acting as the location manager delegate (failure, location update events)
 - Making geocoder lookups
 - Web requests
 - Parsing json
 - Tweaking response to get artist names
 */

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var locationKeyword = ""
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
                    self.locationKeyword = placemarks?[0].country?.replacingOccurrences(of: " ", with: "%20") ?? "united"
                    self.getArtists()
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's locaton. Error: \(error.localizedDescription)"
    }
    
    func getArtists() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(self.locationKeyword)&entity=musicArtist")
            else {
                print("Invalid URL")
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator:", ")
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()

        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to artist response")
            return nil
        }
        
    }
    
}

