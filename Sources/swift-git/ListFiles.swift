import ArgumentParser
import Git

struct ListFiles: ParsableCommand {
  static let configuration = CommandConfiguration(
    commandName: "ls-files",
    abstract: "Show information about files in the index"
  )

  func run() throws {
    let repo = try Repository.current()
    for entry in repo.index.entries {
      print(entry.path)
    }
  }
}
