//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Foundation
import Stinsen

class HobbiesListViewModel: ViewModelObject {

    // MARK: - Properties

    @Published
    private(set) var state: State = .idle

    @Published
    var configuration = HobbiesListConfiguration(hobbies: [])

    @RouterObject
    private var router: HobbiesCoordinator.Router?

    private var hobbyRepository: HobbyRepository

    // MARK: - Lifecycle

    init(hobbyRepository: HobbyRepository) {
        self.hobbyRepository = hobbyRepository
    }
}

// MARK: - Configurations

extension HobbiesListViewModel {
    struct HobbiesListConfiguration {
        var hobbies: [Hobby]
    }
}

// MARK: - Event & State

extension HobbiesListViewModel {
    typealias Event = ViewModelEvent<ViewEvent>
    typealias State = ViewModelState<Bool>

    enum ViewEvent {
        case onViewAppear
        case onClick(hobby: UUID)
        case tryAgain
    }

    func send(_ event: ViewModelEvent<ViewEvent>) {
        if case let .event(viewEvent) = event {
            switch viewEvent {
            case .onViewAppear:
                performOnViewAppear()

            case let .onClick(hobby: hobby):
                performOnClick(id: hobby)

            case .tryAgain:
                state = .success(true)
            }
        }
    }
}

// MARK: - Private Helpers

private extension HobbiesListViewModel {
    func performOnViewAppear() {
        configuration.hobbies = hobbyRepository.getHobbies()
        state = .success(true)
    }

    func performOnClick(id: UUID) {
        if let hobby = configuration.hobbies.first(where: { $0.id == id }) {
            router?.route(to: \.hobbyDetail, hobby.name)
        }
        else {
            state = .failed(HobbiesListError.fail)
        }
    }
}

// MARK: - Login Error

private enum HobbiesListError: Error {
    case fail
}
