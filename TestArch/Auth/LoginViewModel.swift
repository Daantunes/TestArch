//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    // MARK: - Properties

    @Published var username: String = ""

    @Published var password: String = ""

    var userRepository: UserRepository

    weak var delegate: LoginCoordinated?

    // MARK: - Lifecycle

    init(userRepository: UserRepository, delegate: LoginCoordinated) {
        self.userRepository = userRepository
        self.delegate = delegate
    }

    // MARK: - Public Methods

    func login() {
        delegate?.didLogin()
    }

    // MARK: - Private Methods

    private func validatePassword() -> Bool {
        false
    }
}

// MARK: - LoginCoordinated Protocol

protocol LoginCoordinated: AnyObject {
    func didLogin()
}
