//
//  Episode.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation

public struct Episode: Codable, CustomStringConvertible {
    public var description: String {
    """
        self.id = \(id)
        self.name = \(name)
        self.episode = \(episode)
    """
    }
    
    
    public var id: Int
    public var name: String
    public var episode: String
    
    public init(id: Int, name: String, episode: String){
        self.id = id
        self.name = name
        self.episode = episode
    }
}
