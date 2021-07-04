import ArgumentParser
import Foundation
import SystemPackage

struct SwiftGit: ParsableCommand {
  static let configuration = CommandConfiguration(
    commandName: commandName,
    abstract: "A simple reimplementation of parts of the git(1) command using swift-git.",
    subcommands: [Clone.self]
  )
}

private extension SwiftGit {
  static var commandName: String? {
    guard let path = ProcessInfo.processInfo.environment["PATH"] else { return nil }
    let searchDirectories = path.split(separator: ":").lazy.map(FilePath.init)
    for searchDirectory in searchDirectories {
      let candidatePath = searchDirectory.appending("swift-git")
      if FileInfo(at: candidatePath).isExecutableFile {
        return "swift git"
      }
    }
    return nil
  }
}

SwiftGit.main()
