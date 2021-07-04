import ArgumentParser
import Git

struct GitExample: ParsableCommand {
  static let configuration = CommandConfiguration(
    commandName: "example",
    shouldDisplay: false
  )

  @Argument var url: URL
  @Argument var path: FilePath

  func run() throws {
    let repo = try Repository.clone(from: url, to: path)
    print("Cloned to path '\(repo.path)'.")

    let fileCount = repo.index.entries.count
    print("Repsitory contains \(fileCount) files.")

    let head = try repo.head()
    print("HEAD points to commit \(head.commitID).")

    let branch = try repo.makeBranch("new-branch", switch: true)
    assert(head.commitID == branch.commitID)
  }
}
