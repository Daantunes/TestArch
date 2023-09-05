//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import CoreLocation
import SwiftUI

@main
struct TestArchApp: App {

    // MARK: - Properties

    var coordinator = MainCoordinator()

    // MARK: - Scene

    var body: some Scene {
        WindowGroup {
            coordinator.view()
        }
    }
}
