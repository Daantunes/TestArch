import SwiftUI

struct HobbiesListView: View {
    var hobbiesList: [String] = ["Dance", "Photography", "Running"]

    var body: some View {
        NavigationView {
            List {
                ForEach(hobbiesList, id: \.self) { hobby in
                    NavigationLink {
                        HobbiesDetailView(name: hobby)
                    } label: {
                        Text(hobby)
                    }
                }
            }
        }
        .navigationTitle("Hobbies")
    }
}

struct HobbiesListView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesListView()
    }
}
