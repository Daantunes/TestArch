import Foundation
import SwiftUI

class DependecyContainer {

  @ObservedObject
  var userRepository: UserRepository = UserRepository(userService: UserService())

  @ObservedObject
  var hobbyRepository: HobbyRepository = HobbyRepository(hobbyService: HobbyService())
}
