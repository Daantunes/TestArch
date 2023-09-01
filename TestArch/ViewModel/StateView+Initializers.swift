import SwiftUI

// MARK: - All

extension StateView where ErrorStateView == Color, LoadingStateView == ProgressView<EmptyView, EmptyView> {

    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.ViewState) -> Content
    ) {
        self.init(
            source: source,
            errorView: { _ in Color.clear },
            loadingView: ProgressView.init,
            content: content
        )
    }
}

// MARK: - ErrorStateView

extension StateView where ErrorStateView == EmptyView {

    init(
        source: Source,
        @ViewBuilder loadingView: @escaping () -> LoadingStateView,
        @ViewBuilder content: @escaping (Source.ViewState) -> Content
    ) {
        self.init(
            source: source,
            errorView: { _ in EmptyView() },
            loadingView: loadingView,
            content: content
        )
    }
}

// MARK: - LoadingView

extension StateView where LoadingStateView == ProgressView<EmptyView, EmptyView> {

    init(
        source: Source,
        @ViewBuilder errorView: @escaping (Error) -> ErrorStateView,
        @ViewBuilder content: @escaping (Source.ViewState) -> Content
    ) {
        self.init(
            source: source,
            errorView: errorView,
            loadingView: ProgressView.init,
            content: content
        )
    }
}
