//
//  FetchMovieGroups.swift
//  Movie
//
//  Created by Bai xinrui on 2/22/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

public class FetchMovieGroups: EndPoint {
    
    var keyword: String
    private let ammendPath = "search/keyword?"
    
    public init(keyword: String) {
        self.keyword = keyword
    }
    
    public func getMethod() -> HTTPMethod {
        return .get
    }
    
    public func getPath() -> String {
        // "https://api.themoviedb.org/3/search/keyword?api_key=87a901020f496977f9d6d508c5d186ec&query=%22cartoon%22"
        var path = Constants.movieDBHost
        path.append(ammendPath)
        path.append("api_key=\(Constants.defaultApiKey)")
        path.append("&query=\(keyword)")
        return path
    }
}
