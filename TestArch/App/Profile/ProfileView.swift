import SwiftUI

struct ProfileView: View {

    // MARK: - Properties

    @ObservedObject
    var viewModel: ProfileViewModel

    var body: some View {
        StateView(source: viewModel) { _ in
            Text(viewModel.configuration.name)
        }
        .onAppear {
            viewModel.send(.event(.onViewAppear))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(userRepository: UserRepository(userService: UserService())))
    }
}
