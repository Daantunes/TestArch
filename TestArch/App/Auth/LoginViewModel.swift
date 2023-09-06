//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Foundation
import Stinsen

class LoginViewModel: ViewModelObject {

    // MARK: - Properties

    @Published
    private(set) var state: State = .success(true)

    @Published
    var configuration = LoginConfiguration(username: "", password: "")

    @RouterObject
    private var router: MainCoordinator.Router?

    private var userRepository: UserRepository

    // MARK: - Lifecycle

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}

// MARK: - Configurations

extension LoginViewModel {
    struct LoginConfiguration {
        var username: String
        var password: String

        func validatePassword() -> Bool {
            !password.isEmpty
        }

        func validateUsername() -> Bool {
            !username.isEmpty
        }
    }
}

// MARK: - Event & State

extension LoginViewModel {
    typealias Event = ViewModelEvent<ViewEvent>
    typealias State = ViewModelState<Bool>

    enum ViewEvent {
        case loginButtonTap
        case tryAgain
    }

    func send(_ event: ViewModelEvent<ViewEvent>) {
        if case let .event(viewEvent) = event {
            switch viewEvent {
            case .loginButtonTap:
                login()

            case .tryAgain:
                state = .success(true)
            }
        }
    }
}

// MARK: - Private Helpers

private extension LoginViewModel {
    func login() {
        if configuration.validatePassword(), configuration.validateUsername() {
            userRepository.user = User(name: configuration.username, email: "")
            router?.coordinator.root(\.authenticated)
        }
        else {
            state = .failed(LoginError.fail)
        }
    }
}

// MARK: - Login Error

extension LoginViewModel {
    enum LoginError: Error {
        case fail
    }
}
