import Foundation

class HobbyService: BaseService<[Hobby]> {

  func loadHobbies() -> [Hobby]? {
    return load(key: "hobbies")
  }

  func saveUser(data: [Hobby]) -> Bool {
    return save(key: "hobbies", data: data)
  }
}
