import ProjectDescription

public extension TargetReference {

    static let app: Self = .from(target: .testArch)

    static let appTests: Self = .from(target: .testArchTests)
}

// MARK: - Helpers

private extension TargetReference {

    static func from(target: Target) -> Self {
        TargetReference(stringLiteral: target.name)
    }

    static func from(testableTarget: TestableTarget) -> Self {
        TargetReference(stringLiteral: testableTarget.target.targetName)
    }
}
