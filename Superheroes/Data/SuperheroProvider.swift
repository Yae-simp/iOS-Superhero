import Foundation

class SuperheroProvider {
    
    static func findSuperheroesBy(name: String) async throws -> [Superhero] {
        
        // Step 1: Creates the URL to search for superheroes by name.
        let url = URL(string: "https://superheroapi.com/api/7252591128153666/search/\(name)")!
        
        // Step 2: Sends a request to the URL we created and gets back data.
        // 'data' is the superhero information we need, and '_' means we don't care about the other information (such as HTTP response codes).
        // 'await' means we're waiting for the data from the internet (asynchronously), and the app doesn't freeze while waiting.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Step 3: Decode the data we got back into a readable format.
        // The data from the web is in JSON format, so we use JSONDecoder to turn it into a `SuperheroResponse` object.
        let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
        
        // Step 4: Return the list of superheroes from the decoded response.
        return result.results
    }
    
    static func findSuperheroesBy(id: String) async throws -> Superhero {
        let url = URL(string: "https://superheroapi.com/api/7252591128153666/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(Superhero.self, from: data)
        
        return result
    }
}
