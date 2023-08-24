import SwiftUI

struct AppView: View {

//  @StateObject
//  private var appCoordinator = AppCoordinator(path: NavigationPath())

  var body: some View {
    
      switch appEnvironment.state {
        case .loggedIn:
          ContentView()
            .environmentObject(dependencyContainer)
        case .authenticate:
          LoginView(viewModel: dependencyContainer.resolveLoginViewModel())
            .environmentObject(dependencyContainer)
      }
    }
  }
}
