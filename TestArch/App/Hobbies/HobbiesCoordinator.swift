//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Factory
import Stinsen
import SwiftUI

final class HobbiesCoordinator: NavigationCoordinatable {

    // MARK: - Properties

    var stack = NavigationStack(initial: \HobbiesCoordinator.hobbies)

    @Root
    private var hobbies = makeHobbies
    @Route(.push)
    private(set) var hobbyDetail = makeHobbyDetail
}

// MARK: - Views

private extension HobbiesCoordinator {
    func makeHobbies() -> some View {
        HobbiesListView()
    }

    func makeHobbyDetail(name: String) -> some View {
        HobbiesDetailView(viewModel: Container.shared.hobbiesDetailViewModel(name))
    }
}
