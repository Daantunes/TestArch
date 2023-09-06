import ProjectDependencies
import ProjectDescription

public extension Target {

    static let testArch = Target(
        name: "TestArch",
        platform: .iOS,
        product: .app,
        bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
        deploymentTarget: .iOS(
            targetVersion: "15.6",
            devices: .iphone
        ),
        infoPlist: .file(path: "TestArch/App/Configurations/Info.plist"),
        sources: ["TestArch/**"],
        resources: ["TestArch/Resources/**"],
        scripts: [
            .post(
                script: """
                    export PATH="$PATH:/opt/homebrew/bin"

                    if [ -z "$CI" ]; then
                    swiftlint
                    fi
                    """,
                name: "SwiftLint",
                basedOnDependencyAnalysis: false
            ),
            .post(
                script: """
                    export PATH="$PATH:/opt/homebrew/bin"

                    if [ -z "$CI" ]; then
                    swiftformat .
                    fi
                    """,
                name: "SwiftFormat",
                basedOnDependencyAnalysis: false
            )
        ],
        dependencies: [
            .package(product: ProjectDependencies.stinsen.name),
            .package(product: ProjectDependencies.factory.name)
        ],
        settings: .settings(
            configurations: [
                .testArchDebug,
                .testArchProduction
            ]
        )
    )

    static let testArchTests = Target(
        name: "TestArchTests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)Tests",
        deploymentTarget: .iOS(
            targetVersion: "15.6",
            devices: .iphone
        ),
        sources: ["TestArchTests/**"],
        resources: [],
        dependencies: [
            .target(name: "TestArch")
        ]
    )
}
