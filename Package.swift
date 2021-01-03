// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
        .tvOS(.v13),
        .macOS(.v11),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NewMovement_iOS",
            targets: ["NewMovement_iOS"]
        ),
        .library(
            name: "NewMovementMacOS",
            targets: ["NewMovementMacOS"]
        ),
        .library(
            name: "NewMovementCommon",
            targets: ["NewMovementCommon"]
        ),
    ],
    dependencies: [
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui",
                 .upToNextMinor(from: "1.2.0")),
        .package(name: "DependencyResolver",
                 url: "https://github.com/bastianX6/accounts-dependency-resolver",
                 .upToNextMinor(from: "1.0.0")),
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management",
                 .upToNextMinor(from: "1.0.2")),
        .package(name: "SnapshotTesting",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.8.1"),
        .package(name: "SnapshotTesting-Nimble",
                 url: "https://github.com/bastianX6/swift-snapshot-testing-nimble.git",
                 from: "0.3.0"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/Quick/Quick.git",
                 .upToNextMajor(from: "3.0.0")),

    ],
    targets: [
        // NewMovementCommon
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
            dependencies: [
                "NewMovementCommon",
                "Quick",
                "Nimble",
            ]
        ),
        .testTarget(
            name: "NewMovementCommonTests.macOS",
            dependencies: [
                "NewMovementCommon",
                "Quick",
                "Nimble",
                "SnapshotTesting",
                "SnapshotTesting-Nimble",
            ]
        ),
        .testTarget(
            name: "NewMovementCommonTests.iOS",
            dependencies: [
                "NewMovementCommon",
                "Quick",
                "Nimble",
                "SnapshotTesting",
                "SnapshotTesting-Nimble",
            ]
        ),

        // NewMovement_iOS
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
            dependencies: [
                "NewMovement_iOS",
                "SnapshotTesting",
            ]
        ),
        // NewMovement_macOS
        .target(
            name: "NewMovementMacOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "DependencyResolver",
                "NewMovementCommon",
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovement.macOS.Tests",
            dependencies: [
                "NewMovementMacOS",
                "SnapshotTesting",
            ]
        ),
    ]
)
