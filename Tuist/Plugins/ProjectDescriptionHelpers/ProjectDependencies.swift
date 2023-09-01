import ProjectDescription

public enum ProjectDependencies {
    case stinsen
    case factory
}

public extension ProjectDependencies {
    var name: String {
        switch self {
        case .stinsen:
            return "Stinsen"
        case .factory:
            return "Factory"
        }
    }

    var package: Package {
        switch self {
        case .stinsen:
            return .remote(url: "https://github.com/rundfunk47/stinsen", requirement: .upToNextMajor(from: "2.0.0"))
        case .factory:
            return .remote(url: "https://github.com/hmlongco/Factory", requirement: .upToNextMajor(from: "2.2.0"))
        }
    }
}
