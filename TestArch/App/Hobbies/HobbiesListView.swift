import SwiftUI
import Factory

struct HobbiesListView: View {
    
    // MARK: - Properties

    @InjectedObject(\.hobbiesListViewModel)
    var viewModel

    // MARK: - View
    
    var body: some View {
        StateView(source: viewModel) { error in
            Text(error.localizedDescription)
                .onTapGesture {
                    viewModel.send(.event(.tryAgain))
                }
        } content: { _ in
            NavigationView {
                List {
                    ForEach(viewModel.configuration.hobbies) { hobby in
                        HStack {
                            Text(hobby.name)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.send(.event(.onClick(hobby: hobby.id)))
                        }
                    }
                }
            }
            .navigationTitle("Hobbies")
        }
        .onAppear {
            viewModel.send(.event(.onViewAppear))
        }
    }
}

// MARK: - Previews

struct HobbiesListView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesListView(viewModel: InjectedObject(HobbiesListViewModel(hobbyRepository: HobbyRepository(hobbyService: HobbyService()))))
    }
}
