//
//  GetMovieDetail.swift
//  Movie
//
//  Created by Bai xinrui on 2/22/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class GetMovieDetail: EndPoint {
    
    let movieID: String
    let languageType: LanguageType
    
    public init(movieID: String, languageType: LanguageType) {
        self.movieID = movieID
        self.languageType = languageType
    }
    
    func getMethod() -> HTTPMethod {
        return .get
    }
    
    func getPath() -> String {
        //"https://api.themoviedb.org/3/movie/11214?api_key=87a901020f496977f9d6d508c5d186ec&language=en-US"
        var path = Constants.movieDBHost
        path.append("movie/\(movieID)?")
        path.append("api_key=\(Constants.defaultApiKey)")
        path.append("&language=\(languageType.rawValue)")
        return path
    }
    
}
