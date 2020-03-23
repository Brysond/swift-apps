//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Bryson, David (IRG) on 03/03/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
    
}
