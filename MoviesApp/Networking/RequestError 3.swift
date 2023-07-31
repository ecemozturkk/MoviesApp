//
//  RequestError.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 29.06.2023.
//

import Foundation

public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

