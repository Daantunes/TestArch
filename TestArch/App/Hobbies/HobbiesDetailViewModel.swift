//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Foundation

class HobbiesDetailViewModel: ViewModelObject {

    // MARK: - Properties

    @Published
    private(set) var state: State = .success(true)

    @Published
    var configuration: HobbiesDetailConfiguration

    init(name: String) {
        configuration = HobbiesDetailConfiguration(name: name)
    }
}

// MARK: - Configurations

extension HobbiesDetailViewModel {
    struct HobbiesDetailConfiguration {
        var name: String
    }
}

// MARK: - Event & State

extension HobbiesDetailViewModel {
    typealias Event = ViewModelEvent<ViewEvent>
    typealias State = ViewModelState<Bool>

    enum ViewEvent { }

    func send(_ event: ViewModelEvent<ViewEvent>) { }
}
