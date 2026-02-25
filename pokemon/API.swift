    //
    //  API.swift
    //  pokemon
    //
    //  Created by t2025-m0239 on 2026.02.24.
    //

import Foundation
struct API: Codable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let sprites: Sprites
    
    struct Sprites: Codable {
        let frontDefault: URL?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}

