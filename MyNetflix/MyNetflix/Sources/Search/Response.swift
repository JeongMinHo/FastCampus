//
//  Response.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/05.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import Foundation

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}
