//
//  MovieDetail.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {
    var imageURL = "https://image.tmdb.org/t/p/w500/rb5HHy0J4yZYlBA1tqL1akWo6WQ.jpg"
    var language: String?
    var title: String?
    var date: String?
    var overView: String?
    var details = [MovieInfoPair]()
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "poster_path"
        case language = "original_language"
        case title = "original_title"
        case date = "release_date"
        case overView = "overview"
    }
    
    init() {
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let imagePath = try values.decode(String?.self, forKey: .imageURL)
        language = try values.decode(String?.self, forKey: .language)
        title = try values.decode(String?.self, forKey: .title)
        date = try values.decode(String?.self, forKey: .date)
        overView = try values.decode(String?.self, forKey: .overView)
        
        if let path = imagePath {
            imageURL = "\(Constants.imagePrefix)\(path)"
        }
        
        if let language = language {
            details.append(MovieInfoPair(infoType: "Language: ", content: language))
        }
        if let title = title {
            details.append(MovieInfoPair(infoType: "Title: ", content: title))
        }
        if let date = date {
            details.append(MovieInfoPair(infoType: "Date: ", content: date))
        }
        if let overView = overView {
            details.append(MovieInfoPair(infoType: "Overview: ", content: overView))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(language, forKey: .language)
        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(overView, forKey: .overView)
    }
}

struct MovieInfoPair {
    var infoType: String
    var content: String
}
