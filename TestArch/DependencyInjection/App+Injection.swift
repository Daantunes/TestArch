//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Factory

extension Container {

    // MARK: - Repository

    private var userRepository: Factory<UserRepository> {
        self { UserRepository(userService: self.userService()) }
            .singleton
    }

    private var hobbyRepository: Factory<HobbyRepository> {
        self { HobbyRepository(hobbyService: self.hobbyService()) }
            .singleton
    }

    // MARK: - Service

    private var userService: Factory<UserService> {
        self { UserService() }
    }

    private var hobbyService: Factory<HobbyService> {
        self { HobbyService() }
    }

    // MARK: - ViewsModels

    var loginViewModel: Factory<LoginViewModel> {
        self { LoginViewModel(userRepository: self.userRepository()) }
    }

    var profileViewModel: Factory<ProfileViewModel> {
        self { ProfileViewModel(userRepository: self.userRepository()) }
    }

    var hobbiesListViewModel: Factory<HobbiesListViewModel> {
        self { HobbiesListViewModel(hobbyRepository: self.hobbyRepository()) }
    }

    var hobbiesDetailViewModel: ParameterFactory<String, HobbiesDetailViewModel> {
        self { HobbiesDetailViewModel(name: $0) }
    }
}
