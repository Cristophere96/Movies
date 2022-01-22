//
//  CustomErrors.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation

public enum CustomErrors: Error, Equatable {
    public enum ApiRequest: Error, Equatable {
        case serviceError(description: String)
        case unauthorized
        case parseIssue
        case serverUnresponsive
        case emptyJson
        case malformedURL
        case missingToken
        case missingTruevaultDocumentIdOrProviderId
        case missingAuthorizationType
        case authorizationTypeNotSupportedByClient(description: String)
        case missingField
        case badUrlFormat
        case pageNotFound
        case serverError
        case unexpectedEmptyRegex
        case badRequest(description: String?,
                        title: String?,
                        data: Data?)
        case trueVaultProviderEmpty(documentId: String,
                                    providerId: String,
                                    isDocumentId: Bool = true)
        
        public static func badRequest(description: String?, data: Data? = nil) -> ApiRequest {
            return .badRequest(description: description, title: nil, data: data)
        }
    }
}

extension CustomErrors.ApiRequest {
    init?(statusCode: StatusCodes, description: String? = nil, data: Data? = nil) {
        switch statusCode {
        case .badRequestStatusCode:
            self = .badRequest(description: description, data: data)
        case .pageNotFound:
            self = .pageNotFound
        case .notAuthenticatedStatusCode:
            self = .missingToken
        case .unauthorizedStatusCode:
            self = .unauthorized
        case .internalServerErrorStatusCode:
            self = .serverError
        default:
            return nil
        }
    }
}

