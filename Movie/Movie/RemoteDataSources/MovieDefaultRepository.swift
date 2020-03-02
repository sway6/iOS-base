//
//  MovieDefaultRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class MovieDefaultRepository: MovieRepository {
    func getAll() -> [Movie] {
        return []
    }
    
    func get(identifier: String) -> Single<[Movie]> {
        let movieEndPoint = FetchMovieGroups(keyword: identifier)
        var bunchOfMovies = [Movie]()
        
        return Single<[Movie]>.create{ single in
            // Fetch movies based on keywords
            AF.request(movieEndPoint.getPath(), method: .get)
                .responseJSON  { response in
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 200:
                            print("fetch movies success")
                        default:
                            print("error with response status: \(status)")
                        }
                    }
                    // decode JSON value
                    if let result = response.value {
                        let jsonDict = result as! NSDictionary
                        guard let jsonArray = jsonDict["results"] as? NSArray else {
                            return
                        }
                        
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: [])
                            bunchOfMovies = try JSONDecoder().decode([Movie].self, from: jsonData)
                        } catch {
                            print("fail to decode Mives from http response")
                        }
                    }
                    
                    single(.success(bunchOfMovies))
            }
            return Disposables.create()
        }
    }
}
