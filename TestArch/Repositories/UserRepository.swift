import Foundation

class UserRepository: ObservableObject {

  @Published
  var user: User?

  let userService: UserService

  init(userService: UserService) {
    self.userService = userService
    user = userService.loadUser()
  }
}
