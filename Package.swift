// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v11),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NewMovement",
            targets: ["NewMovement"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement", url: "https://github.com/bastianX6/accounts-data-management.git", from: "1.0.0"),
        .package(name: "AccountsUI", url: "https://github.com/bastianX6/accounts-ui.git", from: "1.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NewMovement",
            dependencies: [
                "DataManagement",
                "AccountsUI"
            ]
        ),
        .testTarget(
            name: "NewMovementTests",
            dependencies: ["NewMovement"]
        ),
    ]
)
