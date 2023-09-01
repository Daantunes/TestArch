import SwiftUI

struct HobbiesListView: View {
    var hobbiesList: [String] = ["Dance", "Photography", "Running"]
    @EnvironmentObject private var hobbiesRouter: HobbiesCoordinator.Router

    var body: some View {
        NavigationView {
            List {
                ForEach(hobbiesList, id: \.self) { hobby in
                    HStack {
                        Text(hobby)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        hobbiesRouter.route(to: \.hobbyDetail, hobby)
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
