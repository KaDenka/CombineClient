//
//  ViewModel.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation
import Combine

class ViewModel {
    
    let apiClient: APIClient
    
    internal init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchCharacter(id: Int) -> AnyPublisher<Character, NetworkError> {
        apiClient.character(id: id)
    }
    
    func fetchCharacters(ids: [Int]) -> AnyPublisher<Character, NetworkError> {
        apiClient.mergedCharacters(ids: ids)
    }
    
    func fetchLocation(id: Int) -> AnyPublisher<Location, NetworkError> {
        apiClient.location(id: id)
    }
    
    func fetchEpisode(id: Int) -> AnyPublisher<Episode, NetworkError> {
        apiClient.episode(id: id)
    }
}
