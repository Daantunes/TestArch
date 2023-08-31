import ProjectDescription

public extension Configuration {

    static let testArchDebug: Self = .debug(name: .debug, xcconfig:.debugXcconfig)

    static let testArchProduction: Self = .release(name: .production, xcconfig: .productionXcconfig)

}
