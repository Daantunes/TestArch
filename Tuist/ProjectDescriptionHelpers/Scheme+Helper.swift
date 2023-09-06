import ProjectDescription

public extension Scheme {

    static let testArchDebug = Scheme(
        name: "TestArchDebug",
        shared: true,
        buildAction: .buildAction(
            targets: [
                .app
            ]
        ),
        testAction: .targets(
            [.appTests],
            configuration: .debug
        ),
        runAction: .runAction(
            configuration: .debug
        ),
        archiveAction: .archiveAction(configuration: .debug),
        profileAction: .profileAction(configuration: .debug),
        analyzeAction: .analyzeAction(configuration: .debug)
    )

    static let testArchProd = Scheme(
        name: "TestArchProd",
        shared: true,
        buildAction: .buildAction(
            targets: [
                .app
            ]
        ),
        testAction: .targets(
            [.appTests],
            configuration: .production
        ),
        runAction: .runAction(
            configuration: .production
        ),
        archiveAction: .archiveAction(configuration: .production),
        profileAction: .profileAction(configuration: .production),
        analyzeAction: .analyzeAction(configuration: .production)
    )
}

// MARK: - Tests

public extension Scheme {

    static let testArchUnitTest = Scheme(
        name: "Test Unit",
        shared: true,
        hidden: true,
        buildAction: .buildAction(
            targets: [
                .appTests
            ]
        ),
        testAction: .targets(
            [
                .appTests
            ],
            options: .options(
                coverage: true,
                codeCoverageTargets: [
                    .app
                ]
            )
        ),
        runAction: .runAction(executable: .app)
    )
}
