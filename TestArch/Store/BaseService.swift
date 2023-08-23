import Foundation

class BaseService<T: Codable> {

  func load(key: String) -> T? {
    if let data = UserDefaults.standard.data(forKey: key) {
      if let decoded = try? JSONDecoder().decode(T.self, from: data) {
        return decoded
      }
    }

    return nil
  }

  func save(key: String, data: T) -> Bool {
    do {
      let encoded = try JSONEncoder().encode(data)
      UserDefaults.standard.set(encoded, forKey: key)

      return true
    } catch {
      return false
    }
  }
}
