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
    //    let inputIdPublisher: AnyPublisher<Int, Never>
    let character: AnyPublisher<Character, NetworkError>
    let location: AnyPublisher<Location, NetworkError>
    let episode: AnyPublisher<Episode, NetworkError>
    
    internal init(apiClient: APIClient, inputIdPublisher: AnyPublisher<Int, Never>) {
        self.apiClient = apiClient
        self.character = inputIdPublisher.map { apiClient.character(id: $0) }.switchToLatest().share().eraseToAnyPublisher()
        self.location = inputIdPublisher.map { apiClient.location(id: $0) }.switchToLatest().share().eraseToAnyPublisher()
        self.episode = inputIdPublisher.map { apiClient.episode(id: $0) }.switchToLatest().share().eraseToAnyPublisher()
    }
}
