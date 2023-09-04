import ProjectDescription
import ProjectDescriptionHelpers
import ProjectDependencies

let project = Project(
    name: "TestArch",
    organizationName: "xgeeks",
    options: .options(
        automaticSchemesOptions: .disabled
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
        .testArch
    ],
    schemes: [
        .testArchDebug,
        .testArchProd
    ],
    fileHeaderTemplate: .file(.relativeToRoot("Tuist/file-header-template.txt"))
)