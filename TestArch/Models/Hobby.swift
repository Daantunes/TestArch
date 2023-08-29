import Foundation

enum Difficulty: Codable {
    case easy
    case hard
    case medium
}

struct Hobby: Codable {
    var id = UUID()
    var name: String
    var difficulty: Difficulty
}
