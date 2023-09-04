import SwiftUI

struct HobbiesDetailView: View {

    // MARK: - Properties

    @ObservedObject
    var viewModel: HobbiesDetailViewModel

    // MARK: - View

    var body: some View {
        StateView(source: viewModel) { _ in
            Text(viewModel.configuration.name)
                .foregroundColor(.green)
        }

    }
}

// MARK: - Previews

struct HobbiesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesDetailView(viewModel: HobbiesDetailViewModel(name: "Puzzles"))
    }
}
