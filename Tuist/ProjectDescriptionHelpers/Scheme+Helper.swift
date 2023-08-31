import ProjectDescription

public extension Scheme {

    static let testArchDebug = Scheme(
        name: "TestArchDebug",
        shared: true,
        buildAction: .buildAction(
            targets: [
                TargetReference(stringLiteral: Target.testArch.name)
            ]
        ),
        runAction: .runAction(
            configuration: .debug
        ),
        archiveAction: .archiveAction(configuration: .debug),
        profileAction: .profileAction(configuration: .debug),
        analyzeAction: .analyzeAction(configuration: .debug)
    )

    static let testArchProd =   Scheme(
        name: "TestArchProd",
        shared: true,
        buildAction: .buildAction(
            targets: [
                TargetReference(stringLiteral: Target.testArch.name)
            ]
        ),
        runAction: .runAction(
            configuration: .production
        ),
        archiveAction: .archiveAction(configuration: .production),
        profileAction: .profileAction(configuration: .production),
        analyzeAction: .analyzeAction(configuration: .production)
    )
}
