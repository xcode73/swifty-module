// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "swifty-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "SwiftyModule", targets: ["SwiftyModule"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/xcode73/feather-core.git", branch: "main"),
        .package(path: "../feather-core"),
        .package(url: "https://github.com/JohnSundell/Splash.git", from: "0.16.0"),
    ],
    targets: [
        .target(name: "SwiftyModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "Splash", package: "Splash"),
        ],
        resources: [
            .copy("Bundle"),
        ]),
    ]
)
