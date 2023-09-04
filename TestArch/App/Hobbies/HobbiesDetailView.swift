import SwiftUI

struct HobbiesDetailView: View {
    var name: String
    var body: some View {
        Text(name)
            .foregroundColor(.green)
    }
}

struct HobbiesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesDetailView(name: "Puzzles")
    }
}
