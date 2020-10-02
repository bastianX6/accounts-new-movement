// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NewMovement",
            targets: ["NewMovement"]
        ),
        .library(
            name: "NewMovement-iOS",
            targets: ["NewMovement-iOS"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management.git",
                 from: "1.0.1"),
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 from: "1.0.2"),

    ],
    targets: [
        .target(
            name: "NewMovement",
            dependencies: [
                "DataManagement",
                "AccountsUI",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "NewMovement-iOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "NewMovement"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovementTests",
            dependencies: ["NewMovement"]
        )
    ]
)
