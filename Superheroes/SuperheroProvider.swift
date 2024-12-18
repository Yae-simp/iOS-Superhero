//
//  SuperheroProvider.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import Foundation

class SuperheroProvider {
    
    static func findSuperheroesBy(name: String) async throws -> [Superhero] {
        let url = URL(string: "https://superheroapi.com/api/7252591128153666/search/\(name)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
        
        return result.results
    }
    
    static func findSuperheroesBy(id: String) async throws -> Superhero {
        let url = URL(string: "https://superheroapi.com/api/7252591128153666/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(Superhero.self, from: data)
        
        return result
    }
}
