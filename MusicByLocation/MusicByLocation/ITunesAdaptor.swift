//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Bryson, David (IRG) on 03/03/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided, terminating request.")
            return }
        
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
}
