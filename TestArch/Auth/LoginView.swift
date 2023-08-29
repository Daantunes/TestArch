import SwiftUI

struct LoginView: View {
    @ObservedObject
    var viewModel: LoginViewModel

    @EnvironmentObject
    var appEnvironment: AppEnvironment

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            Button("Log In") {
                viewModel.login()
            }
        }
        .padding()
    }
}

// struct LoginView_Previews: PreviewProvider {
//  static var previews: some View {
//    LoginView(
//      viewModel: LoginViewModel
//    )
//  }
// }
