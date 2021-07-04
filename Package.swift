// swift-tools-version:5.4

import PackageDescription

let package = Package(
  name: "swift-git-example",
  platforms: [
    .macOS(.v10_13),
  ],
  products: [
    .executable(name: "swift-git", targets: ["swift-git"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.3"),
    .package(url: "https://github.com/sharplet/swift-git", .branch("main")),
  ],
  targets: [
    .executableTarget(
      name: "swift-git",
      dependencies: [.argumentParser, .git],
      path: "Packages/swift-git/Sources/swift-git"
    ),
  ]
)

extension Target.Dependency {
  static var argumentParser: Target.Dependency {
    .product(name: "ArgumentParser", package: "swift-argument-parser")
  }

  static var git: Target.Dependency {
    .product(name: "Git", package: "swift-git")
  }
}
