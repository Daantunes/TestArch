//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {

    // MARK: - Properties

    var stack = NavigationStack(initial: \MainCoordinator.start)

    @Root var start = makeStart
    @Root var authenticated = makeAuthenticated
}

// MARK: - Views and Coordinators

private extension MainCoordinator {
    func makeStart() -> some View {
        return DependencyContainer.shared.makeLoginView()
    }

    func makeAuthenticated() -> TabViewCoordinator {
        TabViewCoordinator()
    }
}

