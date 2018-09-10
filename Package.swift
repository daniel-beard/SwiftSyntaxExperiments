// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "SwiftSyntaxRewriter",
  products: [
    .executable(name: "SwiftSyntaxRewriter", targets: ["SwiftSyntaxRewriter"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-syntax.git", .branch("swift-DEVELOPMENT-SNAPSHOT-2018-08-25-a")),
  ],
  targets: [
    .target(
      name: "SwiftSyntaxRewriter",
      dependencies: [
        "SwiftSyntax"
      ]
    )
  ]
)
