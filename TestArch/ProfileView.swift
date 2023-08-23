import SwiftUI

struct ProfileView: View {
  var name: String = "Manel"

  var body: some View {
    Text(name)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
