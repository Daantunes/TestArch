import ProjectDescription

extension Path {

    static let debugXcconfig: Self = .named("TestArchDebug")

    static let productionXcconfig: Self = .named("TestArchProduction")
}

// MARK: - Helpers

private extension Path {

    static func named(_ name: String) -> Self {
        .relativeToRoot("Tuist/Configurations/\(name).xcconfig")
    }
}
