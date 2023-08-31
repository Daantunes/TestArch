import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TestArch",
    organizationName: "xgeeks",
    options: .options(
        automaticSchemesOptions: .disabled
    ),
    packages: [
        .remote(url: "https://github.com/rundfunk47/stinsen", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/hmlongco/Factory", requirement: .upToNextMajor(from: "2.2.0"))
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
