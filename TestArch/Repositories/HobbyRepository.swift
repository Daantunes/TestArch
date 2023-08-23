import Foundation

class HobbyRepository: ObservableObject {

  @Published
  var hobbies: [Hobby] = []

  let hobbyService: HobbyService

  init(hobbyService: HobbyService) {
    self.hobbyService = hobbyService
    hobbies = hobbyService.loadHobbies() ?? []
  }
}
