import Foundation
import SwiftUI

protocol LoginCoordinated: AnyObject {
    func didLogin()
}

class LoginCoordinator: Coordinator {
    typealias ViewType = LoginView

    weak var delegate: AppCoordinated?

    var childCoordinator: (any Coordinator)?

    func build() -> AnyView {
        AnyView(DependencyContainer.shared.makeLoginView(from: self))
    }

    func start() {}

    init(delegate: AppCoordinated?) {
        self.delegate = delegate
    }
}

extension LoginCoordinator: LoginCoordinated {
    func didLogin() {
        delegate?.onLogin()
    }
}
