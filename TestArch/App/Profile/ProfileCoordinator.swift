//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI
import Stinsen

final class ProfileCoordinator: NavigationCoordinatable {

    // MARK: - Properties

    var stack = NavigationStack(initial: \ProfileCoordinator.profile)

    @Root private var profile = makeProfile

}

// MARK: - Views

private extension ProfileCoordinator {
    func makeProfile() -> some View {
        DependencyContainer.shared.makeProfileLoginView()
    }
}
