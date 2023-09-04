//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Foundation

class ProfileViewModel: ViewModelObject {

    // MARK: - Properties

    @Published
    private(set) var state: State = .idle

    @Published
    var configuration = ProfileConfiguration(name: "")

    private var userRepository: UserRepository

    // MARK: - Lifecycle

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}

// MARK: - Configurations

extension ProfileViewModel {
    struct ProfileConfiguration {
        var name: String
    }
}

// MARK: - Event & State

extension ProfileViewModel {
    typealias Event = ViewModelEvent<ViewEvent>
    typealias State = ViewModelState<Bool>

    enum ViewEvent {
        case onViewAppear
    }

    func send(_ event: ViewModelEvent<ViewEvent>) {
        if case let .event(viewEvent) = event {
            switch viewEvent {
            case .onViewAppear:
                performOnViewAppear()
            }
        }
    }
}

// MARK: - Private Helpers

private extension ProfileViewModel {
    func performOnViewAppear() {
        configuration.name = userRepository.getUserName()
        state = .success(true)
    }
}

//// MARK: - Login Error
//
//private enum LoginError: Error {
//    case fail
//}
