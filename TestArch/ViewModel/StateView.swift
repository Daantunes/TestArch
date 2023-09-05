//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import SwiftUI

struct StateView<
    Source: ViewModelObject,
    ErrorStateView: View,
    LoadingStateView: View,
    Content: View
>: View {

    @ObservedObject
    private var source: Source

    private let content: (Source.ViewState) -> Content
    private let errorView: (Error) -> ErrorStateView
    private let loadingView: () -> LoadingStateView

    init(
        source: Source,
        @ViewBuilder errorView: @escaping (Error) -> ErrorStateView,
        @ViewBuilder loadingView: @escaping () -> LoadingStateView,
        @ViewBuilder content: @escaping (Source.ViewState) -> Content
    ) {
        self.content = content
        self.errorView = errorView
        self.loadingView = loadingView
        self.source = source
    }

    // MARK: - View

    var body: some View {
        switch source.state {
        case let .failed(error):
            errorView(error)

        case .idle:
            Color.clear

        case .loading:
            loadingView()

        case let .success(value):
            content(value)
        }
    }
}
