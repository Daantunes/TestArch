import Foundation

class UserService: BaseService<User> {

  func loadUser() -> User? {
    return load(key: "user")
  }

  func saveUser(data: User) -> Bool {
    return save(key: "user", data: data)
  }
}
