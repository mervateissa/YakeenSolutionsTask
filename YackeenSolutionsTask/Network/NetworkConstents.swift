//
//  NetworkConstents.swift
//  YackeenSolutionsTask
//
//  Created by mervat on 24/12/2021.
//

import Foundation

struct KNetworkConstants {
    struct ProductionServer {
        static let baseURL = "http://api.tvmaze.com/"
    }
    
    enum EndPoint: String {
        case popularShows = "search/shows?q=Future"
    }
    enum HTTPHeaderField: String {
            case authentication = "Authorization"
            case contentType = "Content-Type"
            case acceptType = "Accept"
            case acceptEncoding = "Accept-Encoding"
            case acceptLanguage = "Accept-Language"
        }
    enum ContentType: String {
            case json = "application/json"
            case formData = "form-data"
            case multipart = "multipart/form-data"
            case bearer = "Bearer"
        }
}

