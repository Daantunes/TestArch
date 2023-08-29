import Foundation
import SwiftUI

final class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()

    var userRepository: UserRepository = .init(userService: UserService())

    var hobbyRepository: HobbyRepository = .init(hobbyService: HobbyService())

    // MARK: - Views -

    func makeLoginView(from coordinator: LoginCoordinated) -> LoginView {
        LoginView(viewModel: resolveLoginViewModel(delegate: coordinator))
    }

    // MARK: - View Models -

    func resolveLoginViewModel(delegate: LoginCoordinated) -> LoginViewModel {
        LoginViewModel(userRepository: userRepository, delegate: delegate)
    }
}
