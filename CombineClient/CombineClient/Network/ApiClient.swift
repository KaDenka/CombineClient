//
//  ApiClient.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation
import Combine

struct APIClient {
    
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "APIClient", qos: .default, attributes: .concurrent)
    
    func character(id: Int) -> AnyPublisher<Character, NetworkError> {
        URLSession.shared
            .dataTaskPublisher(for: Method.character(id).url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Character.self, decoder: decoder)
            .mapError ({ error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.unreachableAddress(url: Method.character(id).url)
                default:
                    return NetworkError.invalidResponse
                }
            })
            .eraseToAnyPublisher()
    }
    
    func mergedCharacters(ids: [Int]) -> AnyPublisher<Character, NetworkError> {
        precondition(!ids.isEmpty)
        
        let initialPublisher = character(id: ids[0])
        let reminder = Array(ids.dropFirst())
        
        return reminder.reduce(initialPublisher) { (combined, id) in
            return combined
                .merge(with: character(id: id))
                .eraseToAnyPublisher()
        }
    }
    
    func location(id: Int) -> AnyPublisher<Location, NetworkError> {
        URLSession.shared
            .dataTaskPublisher(for: Method.location(id).url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Location.self, decoder: decoder)
            .mapError ({ error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.unreachableAddress(url: Method.character(id).url)
                default:
                    return NetworkError.invalidResponse
                }
            })
            .eraseToAnyPublisher()
    }
    
    func episode(id: Int) -> AnyPublisher<Episode, NetworkError> {
        URLSession.shared
            .dataTaskPublisher(for: Method.episode(id).url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Episode.self, decoder: decoder)
            .mapError ({ error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.unreachableAddress(url: Method.character(id).url)
                default:
                    return NetworkError.invalidResponse
                }
            })
            .eraseToAnyPublisher()
    }
}
