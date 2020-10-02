// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private var targets: [Target] = [
    .target(
        name: "NewMovement",
        dependencies: [
            "DataManagement",
            "AccountsUI"
        ],
        resources: [.process("Resources")]
    ),
]

#if os(iOS)
    targets.append(
        .testTarget(
            name: "NewMovementTests",
            dependencies: ["NewMovement"]
        )
    )
#endif

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
    ],
    dependencies: [
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management.git",
                 from: "1.0.1"),
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 from: "1.0.2"),

    ],
    targets: targets
)
