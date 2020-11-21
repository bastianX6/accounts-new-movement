// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement_iOS",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "NewMovement_iOS",
            targets: ["NewMovement_iOS"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management.git",
                 from: "1.0.2"),
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 from: "1.1.0"),
        .package(name: "DependencyResolver",
                 url: "https://github.com/bastianX6/accounts-dependency-resolver",
                 from: "1.0.0"),
        .package(path: "../NewMovementCommon"),
    ],
    targets: [
        .target(
            name: "NewMovement_iOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "DependencyResolver",
                "NewMovementCommon",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovement.iOS.Tests",
            dependencies: ["NewMovement_iOS"]
        ),
    ]
)
