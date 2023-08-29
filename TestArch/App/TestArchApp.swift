import CoreLocation
import SwiftUI

@main
struct TestArchApp: App {
    var appEnvironment: AppEnvironment

    var coordinator: AppCoordinator

    init() {
        appEnvironment = AppEnvironment()
        coordinator = AppCoordinator(appEnvironment: appEnvironment)
    }

    var body: some Scene {
        WindowGroup {
            coordinator.build()
                .environmentObject(appEnvironment)
        }
    }
}
