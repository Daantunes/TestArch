import Foundation
import SwiftUI

struct HobbyRepository {

  var hobbies: [Hobby] = []

  let hobbyService: HobbyService

  init(hobbyService: HobbyService) {
    self.hobbyService = hobbyService
    hobbies = hobbyService.loadHobbies() ?? []
  }
}
