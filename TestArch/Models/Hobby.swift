import Foundation

enum Difficulty: Codable {
  case easy, hard, medium
}

struct Hobby: Codable {
  var id = UUID()
  var name: String
  var difficulty: Difficulty
}
