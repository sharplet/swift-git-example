import ArgumentParser
import SystemPackage

extension FilePath {
  init<S: StringProtocol>(_ path: S) {
    self.init(String(path))
  }
}

extension FilePath: ExpressibleByArgument {
  public init?(argument: String) {
    self.init(argument)
  }
}
