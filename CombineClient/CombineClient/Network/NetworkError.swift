//
//  NetworkError.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case unreachableAddress(url: URL)
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .unreachableAddress(let url):
            return "\(url.absoluteString) is unreachable."
        case .invalidResponse:
            return "Response with mistake."
        }
    }
}
