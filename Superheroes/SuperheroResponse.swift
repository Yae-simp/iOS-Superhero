import Foundation

struct SuperheroResponse: Codable {
    let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
    let image: Image
    let biography: Biography
}

struct Biography: Codable {
    let realName: String
    let publisher: String
    let alignment: String
    let placeOfBirth: String
    
    private enum CodingKeys : String, CodingKey {
        case alignment, publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

struct Image: Codable {
    let url: String
}