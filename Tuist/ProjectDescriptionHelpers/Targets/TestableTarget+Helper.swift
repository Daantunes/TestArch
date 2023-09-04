import ProjectDescription

public extension TestableTarget {

    static let appTests: Self = .from(target: .testArchTests)

}

// MARK: - Helpers

private extension TestableTarget {

    static func from(target: Target) -> Self {
        TestableTarget(stringLiteral: target.name)
    }
}
