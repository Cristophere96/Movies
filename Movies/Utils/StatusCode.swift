//
//  StatusCode.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation

public enum StatusCodes: Int {
    case successStatusCode = 200
    case redirectionStatusCode = 300
    case badRequestStatusCode = 400
    case notAuthenticatedStatusCode = 401
    case unauthorizedStatusCode = 403
    case pageNotFound = 404
    case internalServerErrorStatusCode = 500
    
    init(from rawValue: Int) {
        self = StatusCodes(rawValue: rawValue) ?? .internalServerErrorStatusCode
    }
}
