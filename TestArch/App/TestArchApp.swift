import SwiftUI
import CoreLocation

@main
struct TestArchApp: App {

  var appEnvironment: AppEnvironment

  var coordinator: AppCoordinator

  init() {
    self.appEnvironment = AppEnvironment()
    self.coordinator = AppCoordinator(appEnvironment: appEnvironment)
  }

  var body: some Scene {
    WindowGroup {
      coordinator.build()
        .environmentObject(appEnvironment)
    }
  }
}
