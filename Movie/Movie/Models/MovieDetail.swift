//
//  MovieDetail.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

struct MovieDetail {
    var imageURL: String
    var details: [MovieInfoPair]
}

struct MovieInfoPair {
    var infoType: String
    var content: String
}
