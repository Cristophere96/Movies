//
//  NetworkServiceType.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation
import Combine

protocol NetworkServiceType {
    func request<Response>(_ endpoint: APIRequest<Response>,
                           queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response : Decodable
}
