import Foundation

class UserService: BaseService<User> {
    func loadUser() -> User? {
        load(key: "user")
    }

    func saveUser(data: User) -> Bool {
        save(key: "user", data: data)
    }
}
