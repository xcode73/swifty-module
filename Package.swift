// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "swifty-module",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "SwiftyModule", targets: ["SwiftyModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xcode73/feather-core", .branch("test-dev")),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.16.0"),
    ],
    targets: [
        .target(name: "SwiftyModule", dependencies: [
            .product(name: "Feather", package: "feather-core"),
            .product(name: "Splash", package: "Splash"),
        ],
        resources: [
            .copy("Bundle"),
        ]),
    ]
)
