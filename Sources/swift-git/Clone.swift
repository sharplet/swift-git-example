import ArgumentParser
import Foundation
import Git
import SystemPackage

struct Clone: ParsableCommand {
  static let configuration = CommandConfiguration(abstract: "Clone a repository")

  @Argument var url: URL
  @Argument var path: FilePath?

  func run() throws {
    let path = path ?? FilePath(url.lastPathComponent)
    print("Cloning into path '\(path)'...", terminator: "")
    do {
      _ = try Repository.clone(to: path, from: url)
      print(" done.")
    } catch {
      print()
      throw error
    }
  }
}
