// swift-tools-version:5.3
import PackageDescription

let isLocalTestMode = false

var deps: [Package.Dependency] = [
    .package(url: "https://github.com/feathercms/feather-core", .branch("main")),// from: "1.0.0-beta"),
    .package(url: "https://github.com/JohnSundell/Splash", from: "0.15.0"),
]

var targets: [Target] = [
    .target(name: "SwiftyModule", dependencies: [
        .product(name: "FeatherCore", package: "feather-core"),
        .product(name: "Splash", package: "Splash"),
    ],
    resources: [
        .copy("Bundle"),
    ]),
]

// @NOTE: https://bugs.swift.org/browse/SR-8658
if isLocalTestMode {
    deps.append(contentsOf: [
        /// drivers
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0"),
    ])
    targets.append(contentsOf: [
        .target(name: "Feather", dependencies: [
            /// drivers
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            .target(name: "SwiftyModule"),
        ]),
        .testTarget(name: "SwiftyModuleTests", dependencies: [
            .target(name: "SwiftyModule"),
        ])
    ])
}

let package = Package(
    name: "swifty-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "SwiftyModule", targets: ["SwiftyModule"]),
    ],
    dependencies: deps,
    targets: targets
)
