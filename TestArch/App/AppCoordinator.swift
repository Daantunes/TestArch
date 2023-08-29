import SwiftUI

protocol Coordinator: AnyObject {
    func build() -> AnyView
    func start()
}

protocol AppCoordinated: AnyObject {
    func onLogin()
}

class AppCoordinator: Coordinator, ObservableObject {
    var childCoordinator: Coordinator?

    var appEnvironment: AppEnvironment

    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func build() -> AnyView {
        start()

        return AnyView(AppCoordinatorView(coordinator: self))
    }
    
    func start() {
        switch appEnvironment.state {
        case .loggedIn:
            startContentCoordinator()

        case .authenticate:
            startLoginCoordinator()
        }
    }

    func startLoginCoordinator() {
        let coordinator = LoginCoordinator(delegate: self)
        childCoordinator = coordinator
    }

    func startContentCoordinator() {
        let coordinator = ContentCoordinator()
        childCoordinator = coordinator
    }
}

extension AppCoordinator: AppCoordinated {
    func onLogin() {
        appEnvironment.changeState(from: self, to: .loggedIn)
        start()
    }
}
