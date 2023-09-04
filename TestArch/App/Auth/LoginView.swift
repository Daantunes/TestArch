//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI
import Factory

struct LoginView: View {

    // MARK: - Properties

    @InjectedObject(\.loginViewModel)
    var viewModel

    // MARK: - View

    var body: some View {
        StateView(source: viewModel) { error in
            Text(error.localizedDescription)
                .onTapGesture {
                    viewModel.send(.event(.tryAgain))
                }
        } content: { _ in
            content
        }
    }

    var content: some View {
        VStack {
            TextField("Username", text: $viewModel.configuration.username)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $viewModel.configuration.password)
                .textFieldStyle(.roundedBorder)
            Button("Log In") {
                viewModel.send(.event(.loginButtonTap))
            }
        }
        .padding()
    }
}

// MARK: - Previews

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
