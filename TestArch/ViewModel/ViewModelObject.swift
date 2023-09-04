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

// MARK: Equatable

extension ViewModelState: Equatable {

    static func == (lhs: ViewModelState<Value>, rhs: ViewModelState<Value>) -> Bool {
        switch (lhs, rhs) {
        case let (.failed(lhsError), .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription

        case (.idle, .idle):
            return true

        case (.loading, .loading):
            return true

        case let (.success(lhsValue), .success(rhsValue)):
            return lhsValue == rhsValue

        default:
            return false
        }
    }
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
