import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published
    var username: String = ""

    @Published
    var password: String = ""

    var userRepository: UserRepository

    weak var delegate: LoginCoordinated?

    init(userRepository: UserRepository, delegate: LoginCoordinated) {
        self.userRepository = userRepository
        self.delegate = delegate
    }

    func validatePassword() -> Bool {
        false
    }

    func login() {
        delegate?.didLogin()
    }
}
