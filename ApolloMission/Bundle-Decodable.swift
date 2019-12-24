//
//  Bundle-Decodable.swift
//  ApolloMission
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate file \(file) from Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file \(file) from Bundle.")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode file \(file) from Bundle.")
        }
        
        return loaded
    }
    
    
}
