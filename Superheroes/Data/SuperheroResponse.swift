import Foundation

struct SuperheroResponse: Codable {
    let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
    let image: Image
    let biography: Biography
    let powerstats: Stats
}

struct Biography: Codable {
    let realName: String
    let publisher: String
    let alignment: String
    let placeOfBirth: String
    let alterEgos: String
    
    private enum CodingKeys : String, CodingKey {
        case alignment, publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
        case alterEgos = "alter-egos"
    }
}

struct Image: Codable {
    let url: String
}

struct Stats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}
