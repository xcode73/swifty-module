// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "swifty-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "SwiftyModule", targets: ["SwiftyModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/feather-core", .branch("main")),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.13.0"),
    ],
    targets: [
        .target(name: "SwiftyModule",
                dependencies: [
                    .product(name: "FeatherCore", package: "feather-core"),
                    .product(name: "Splash", package: "Splash"),
                ]
        ),
        .testTarget(name: "SwiftyModuleTests",
                    dependencies: [
                        .target(name: "SwiftyModule"),
                    ])
    ]
)
