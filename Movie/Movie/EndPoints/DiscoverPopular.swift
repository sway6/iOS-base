//
//  DiscoverPopular.swift
//  Movie
//
//  Created by Bai xinrui on 2/22/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class DiscoverPopular: EndPoint {
    
    var languageType: LanguageType
    var sortBy: OrderType
    var includeAdult: Bool
    var includeVideo: Bool
    var pageNum: Int
    private let ammendPath = "discover/movie?"
    
    public init(languageType: LanguageType, sortBy: OrderType, includeAdult: Bool, includeVideo: Bool, pageNum: Int = 1) {
        self.languageType = languageType
        self.sortBy = sortBy
        self.includeAdult = includeAdult
        self.includeVideo = includeVideo
        self.pageNum = pageNum
    }
    
    func getMethod() -> HTTPMethod {
        return .get
    }
    
    func getPath() -> String {
        //"https://api.themoviedb.org/3/discover/movie?api_key=87a901020f496977f9d6d508c5d186ec&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        var path = Constants.movieDBHost
        path.append(ammendPath)
        path.append("api_key=\(Constants.defaultApiKey)")
        path.append("&language=\(languageType.rawValue)")
        path.append("&sort_by=\(sortBy.rawValue)")
        path.append("&include_adult=\(includeAdult)")
        path.append("&include_video=\(includeVideo)")
        path.append("&page=\(pageNum)")
        
        return path
    }
}

public enum LanguageType: String {
    case english = "en-US"
}

public enum OrderType: String {
    case asc   = "popularity.asc"
    case desc  = "popularity.desc"
}
