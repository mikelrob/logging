// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LoggingKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "LoggingKit",
            targets: ["LoggingKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble", from: "8.0.0"),
        .package(url: "https://github.com/Quick/Quick", from: "2.1.0"),
    ],
    targets: [
        .target(
            name: "LoggingKit",
            dependencies: [ ]),
        .testTarget(
            name: "LoggingKitTests",
            dependencies: ["LoggingKit", "Quick", "Nimble"]),
    ]
)
