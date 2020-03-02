//
//  EndPoint.swift
//  Movie
//
//  Created by Bai xinrui on 2/22/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "Put"
    case delete = "DELETE"
}

public protocol EndPoint: class {
    func getMethod() -> HTTPMethod
    func getPath() -> String
}

extension EndPoint {
    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: getPath()) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = getMethod().rawValue
        return request
    }
}
