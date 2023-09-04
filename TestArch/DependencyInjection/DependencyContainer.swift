import Foundation
import SwiftUI

final class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()

    var userRepository: UserRepository = .init(userService: UserService())

    var hobbyRepository: HobbyRepository = .init(hobbyService: HobbyService())

    // MARK: - Views -

    func makeLoginView() -> LoginView {
        LoginView(viewModel: resolveLoginViewModel())
    }

    func makeProfileLoginView() -> ProfileView {
        ProfileView(viewModel: resolveProfileViewModel())
    }

    // MARK: - View Models -

    func resolveLoginViewModel() -> LoginViewModel {
        LoginViewModel(userRepository: userRepository)
    }

    func resolveProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(userRepository: userRepository)
    }
}
