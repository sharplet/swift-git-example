import Foundation
import SystemPackage

struct FileInfo {
  var path: FilePath

  init(at path: FilePath) {
    self.path = path
  }

  var isExecutableFile: Bool {
    path.withCString { access($0, CInt(S_IXUSR)) == 0 }
  }
}
