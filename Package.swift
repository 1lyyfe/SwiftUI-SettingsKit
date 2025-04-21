// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SettingsKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SettingsKit", targets: ["SettingsKit"])
    ],
    targets: [
        .target(
            name: "SettingsKit",
            path: "Sources/SettingsKit"
        ),
        .testTarget(
            name: "SettingsKitTests",
            dependencies: ["SettingsKit"],
            path: "Tests/SettingsKitTests"
        )
    ]
)
