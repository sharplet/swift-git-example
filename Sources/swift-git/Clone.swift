import ArgumentParser
import Foundation
import Git
import SystemPackage

struct Clone: ParsableCommand {
  static let configuration = CommandConfiguration(abstract: "Clone a repository")

  @Argument(help: "The remote URL to clone from.") var url: URL

  @Argument(help: """
    The local path to create the new repository. \
    Defaults to the URL's last path component, with file extensions removed.
    """)
  var path: FilePath?

  func run() throws {
    let path = path ?? localPathFromURL
    print("Cloning into path '\(path)'...", terminator: "")
    do {
      _ = try Repository.clone(to: path, from: url)
      print(" done.")
    } catch {
      print()
      throw error
    }
  }

  private var localPathFromURL: FilePath {
    if let path = path {
      return path
    } else {
      return FilePath(url.deletingPathExtension().lastPathComponent)
    }
  }
}
