//
//  ApiClient.swift
//  YackeenSolutionsTask
//
//  Created by mervat on 24/12/2021.
//

import Foundation
enum NetworkErrorType: String, Error {
    case noInternet = "error.no_internet"
    case serverError = "error.error_in_server"
    case couldNotParseJson = "error.decoding_error"
    case empty = "error.empty"
    case authenicationRequired = "error.authentication_required"
    case catchError
}
class ApiClient {
    class func performCustomRequest<T: Codable>(endUrl endPoint: String, type: T.Type, completion: @escaping (Result<T, NetworkErrorType>) -> Void) {
        guard let url = URL(string: String(format: "%@%@", KNetworkConstants.ProductionServer.baseURL, endPoint)) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        HeaderInterceptor.defaultHeaderInterceptor(fromURLRequest: &request)
       
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.serverError))
                return
            }
//            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
//            print(response)
//            print(response.result)
//            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
            guard let data = data else { print("Empty data"); return }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                print("Failed to decode:", error)
                completion(.failure(.couldNotParseJson))
            }
        }.resume()
    }
}
