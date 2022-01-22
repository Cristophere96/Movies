//
//  APIRequest.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation

public class APIRequest<Response> {
    public let relativePath: String

    public init(relativePath: String) {
        self.relativePath = relativePath
    }
}
