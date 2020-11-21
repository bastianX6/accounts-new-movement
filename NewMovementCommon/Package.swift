// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovementCommon",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "NewMovementCommon",
            targets: ["NewMovementCommon"]
        ),
    ],
    dependencies: [
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 .upToNextMinor(from: "1.1.0")),
        .package(name: "DependencyResolver",
                 url: "https://github.com/bastianX6/accounts-dependency-resolver",
                 .upToNextMinor(from: "1.0.0")),

    ],
    targets: [
        .target(
            name: "NewMovementCommon",
            dependencies: [
                "AccountsUI",
                "DependencyResolver",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovementCommonTests",
            dependencies: ["NewMovementCommon"]
        ),
    ]
)
