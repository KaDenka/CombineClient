//
//  CharacterPage.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation

public struct CharacterPage: Codable {
    public var info: PageInfo
    public var results: [Character]
    
    public init(info: PageInfo, results: [Character]) {
        self.info = info
        self.results = results
    }
}
