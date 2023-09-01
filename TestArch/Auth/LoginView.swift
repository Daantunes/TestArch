//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    // MARK: - Properties

    @ObservedObject
    var viewModel: LoginViewModel

    // MARK: - View

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

// MARK: - Previews

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

        // TODO: Fix preview
        EmptyView()
    }
}
