import ProjectDescription

public extension TestableTarget {

    static let appTests: Self = .from(target: .testArch)

}

// MARK: - Helpers

private extension TestableTarget {

    static func from(target: Target) -> Self {
        TestableTarget(stringLiteral: target.name)
    }
}
