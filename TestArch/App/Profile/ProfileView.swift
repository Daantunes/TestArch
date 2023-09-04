import SwiftUI
import Factory

struct ProfileView: View {

    // MARK: - Properties

    @InjectedObject(\.profileViewModel)
    var viewModel

    // MARK: - View
    
    var body: some View {
        StateView(source: viewModel) { _ in
            Text(viewModel.configuration.name)
        }
        .onAppear {
            viewModel.send(.event(.onViewAppear))
        }
    }
}

// MARK: - Previews

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: InjectedObject(\.profileViewModel))
    }
}
