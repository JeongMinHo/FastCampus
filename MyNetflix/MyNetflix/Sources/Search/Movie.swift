//
//  Movie.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/05.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}
