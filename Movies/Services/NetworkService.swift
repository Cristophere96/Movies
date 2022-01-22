//
//  NetworkService.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation
import Combine

public class NetworkService {
    private var session = URLSession.shared
    
    private func getURLRequest(urlPath: String) -> URLRequest? {
        let url = URL(string: "\(Constants.URLs.baseURL + urlPath)?api_key=\(Constants.URLs.apiKey)")
        
        guard let requestURL: URL = url else { return nil }
        
        let request = URLRequest(url: requestURL)
        
        return request
    }
}

extension NetworkService : NetworkServiceType {
    func request<Response>(_ endpoint: APIRequest<Response>,
                           queue: DispatchQueue = .main) -> AnyPublisher<Response, Error> where Response : Decodable {
        guard let request = getURLRequest(urlPath: endpoint.relativePath) else {
            return Fail<Response, Error>(error: CustomErrors.ApiRequest.malformedURL)
                .eraseToAnyPublisher()
        }
        let decoder = JSONDecoder()
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw CustomErrors.ApiRequest.serverError
                }
                
                if !(200 ..< 300 ~= httpResponse.statusCode) {
                    let statusCode = StatusCodes(from: httpResponse.statusCode)
                    let error = CustomErrors.ApiRequest(statusCode: statusCode)
                    
                    debugPrint("Error Endpoint: \(request.url?.absoluteString ?? "")")
                    
                    if var resString = String(data: data, encoding: .utf8) {
                        resString.removeAll(where: { $0 == "\\" })
                        debugPrint("** Error Response data: ** : \(resString)")
                    }
                    
                    throw error ?? .serverError
                }
                
                return data
            }
            .decode(type: Response.self, decoder: decoder)
            .receive(on: queue)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
