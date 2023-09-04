import Foundation
import SwiftUI

final class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()

    private var userRepository: UserRepository = .init(userService: UserService())

    private var hobbyRepository: HobbyRepository = .init(hobbyService: HobbyService())

    // MARK: - Views -

    func makeLoginView() -> LoginView {
        LoginView(viewModel: resolveLoginViewModel())
    }

    func makeProfileLoginView() -> ProfileView {
        ProfileView(viewModel: resolveProfileViewModel())
    }

    func makeHobbiesListView() -> HobbiesListView {
        HobbiesListView(viewModel: resolveHobbiesListViewModel())
    }

    // MARK: - View Models -

    private func resolveLoginViewModel() -> LoginViewModel {
        LoginViewModel(userRepository: userRepository)
    }

    private func resolveProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(userRepository: userRepository)
    }

    private func resolveHobbiesListViewModel() -> HobbiesListViewModel {
        HobbiesListViewModel(hobbyRepository: hobbyRepository)
    }
}
