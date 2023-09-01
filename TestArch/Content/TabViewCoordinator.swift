//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI
import Stinsen

final class TabViewCoordinator: TabCoordinatable {

    // MARK: - Properties

    var child = TabChild(
        startingItems: [
            \TabViewCoordinator.profile,
             \TabViewCoordinator.hobbies,
        ]
    )

    @Route(tabItem: makeProfileTab) private var profile = makeProfile
    @Route(tabItem: makeHobbiesTab) private var hobbies = makeHobbies
}

// MARK: - Views and Coordinators

private extension TabViewCoordinator {
    
    func makeProfileTab(isActive: Bool) -> some View {
        Label("Profile", systemImage: isActive ? "person.fill" : "person")
    }

    func makeHobbiesTab(isActive: Bool) -> some View {
        Label("Hobbies", systemImage: isActive ? "figure.run.circle.fill" : "figure.run.circle")
    }

    func makeProfile() -> NavigationViewCoordinator<ProfileCoordinator> {
        NavigationViewCoordinator(ProfileCoordinator())
    }

    func makeHobbies() -> NavigationViewCoordinator<HobbiesCoordinator> {
        NavigationViewCoordinator(HobbiesCoordinator())
    }

}
