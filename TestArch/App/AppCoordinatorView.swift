import SwiftUI

struct AppCoordinatorView: View {
    // MARK: Stored Properties

    var coordinator: AppCoordinator

    @EnvironmentObject
    var appEnvironment: AppEnvironment

    var body: some View {
        coordinator.childCoordinator?.build()
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView(coordinator: AppCoordinator(appEnvironment: AppEnvironment()))
    }
}
