import Foundation

enum AppState: Equatable {
    case loggedIn
    case authenticate
}

class AppEnvironment: ObservableObject {
    @Published
    private(set) var state: AppState = .authenticate

    func changeState(from _: any Coordinator, to state: AppState) {
        self.state = state
    }
}
