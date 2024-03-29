import Foundation
import SwiftUI

class UserRepository {
    @Published
    var user: User?

    let userService: UserService

    init(userService: UserService) {
        self.userService = userService
        user = userService.loadUser()
    }

    func getUserName() -> String {
        user?.name ?? "Anonimous"
    }
}
