//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import Foundation

protocol ViewModelObject: ObservableObject {
    associatedtype ViewEvent
    associatedtype ViewState: Equatable
    associatedtype ViewConfiguration

    var state: ViewModelState<ViewState> { get }
    var configuration: ViewConfiguration { get }

    func send(_ event: ViewModelEvent<ViewEvent>)
}

// MARK: - ContentViewEvent

enum ViewModelEvent<Value> {
    case event(Value)
}

// MARK: - ContentViewState

enum ViewModelState<Value: Equatable> {
    case failed(Error)
    case idle
    case loading
    case success(Value)
}

// MARK: Properties

extension ViewModelState {

    var isLoading: Bool {
        guard case .loading = self else {
            return false
        }
        return true
    }
}
