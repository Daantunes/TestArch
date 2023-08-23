import SwiftUI

struct LoginView: View {
  @State var username: String = ""
  @State var password: String = ""

  var body: some View {
    VStack {
      TextField("Username", text: $username)
        .textFieldStyle(.roundedBorder)
      TextField("Password", text: $password)
        .textFieldStyle(.roundedBorder)
      Button("Log In") {
        print("Logged In")
      }
    }
    .padding()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
