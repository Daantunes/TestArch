import Foundation

class HobbyService: BaseService<[Hobby]> {
    func loadHobbies() -> [Hobby]? {
        load(key: "hobbies")
    }

    func saveUser(data: [Hobby]) -> Bool {
        save(key: "hobbies", data: data)
    }
}
