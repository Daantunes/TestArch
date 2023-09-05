import ProjectDescription
import ProjectDependencies

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
        dependencies: [
            .package(product: ProjectDependencies.stinsen.name),
            .package(product: ProjectDependencies.factory.name),
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
