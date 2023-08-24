import Foundation

enum AppState: Equatable {
  case loggedIn, authenticate
}

class AppEnvironment: ObservableObject {

  @Published
  private(set) var state: AppState = .authenticate

  func changeState(from: any Coordinator, to state: AppState) {
    self.state = state
  }
}
