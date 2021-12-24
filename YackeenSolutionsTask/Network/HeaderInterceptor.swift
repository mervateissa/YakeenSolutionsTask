//
//  HeaderInterceptor.swift
//  YackeenSolutionsTask
//
//  Created by mervat on 25/12/2021.
//

import Foundation
final class HeaderInterceptor {
    
    static func defaultHeaderInterceptor(fromURLRequest urlRequest: inout URLRequest) {
        urlRequest.setValue(KNetworkConstants.ContentType.json.rawValue, forHTTPHeaderField: KNetworkConstants.HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(KNetworkConstants.ContentType.json.rawValue, forHTTPHeaderField: KNetworkConstants.HTTPHeaderField.contentType.rawValue)
        
    }
}
