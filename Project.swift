import ProjectDescription
import ProjectDescriptionHelpers
import ProjectDependencies

let project = Project(
    name: "TestArch",
    organizationName: "xgeeks",
    options: .options(
        automaticSchemesOptions: .disabled,
        disableBundleAccessors: true,
        disableSynthesizedResourceAccessors: true
    ),
    packages: [
        ProjectDependencies.stinsen.package,
        ProjectDependencies.factory.package
    ],
    settings: .settings(configurations: [
        .testArchDebug,
        .testArchProduction
    ]),
    targets: [
        .testArch,
        .testArchTests
    ],
    schemes: [
        .testArchDebug,
        .testArchProd,
        .testArchUnitTest
    ],
    fileHeaderTemplate: .file(.relativeToRoot("Tuist/file-header-template.txt"))
)
