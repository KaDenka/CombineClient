//
//  Location.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import Foundation

public struct Location: Codable {
    
    public var id: Int
    public var name: String
    public var type: String
    public var dimension: String
    
    public init(id: Int, name: String, type: String, dimension: String){
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
    }
}
