import SwiftUI
import CoreLocation

@main
struct TestArchApp: App {
  var isLoggedIn: Bool = true

  var body: some Scene {
    WindowGroup {
      if isLoggedIn {
        ContentView()
      } else {
        LoginView()
      }
    }
  }
}
