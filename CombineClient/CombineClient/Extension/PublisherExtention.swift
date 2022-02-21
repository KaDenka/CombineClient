//
//  PublisherExtention.swift
//  CombineClient
//
//  Created by Denis Kazarin on 21.02.2022.
//

import Foundation
import Combine

extension Publisher {
    func modified() -> AnyPublisher<Self.Output, Self.Failure> {
        return share()
            .eraseToAnyPublisher()
    }
}
