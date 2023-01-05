// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var package = Package(
    name: "BMXCore",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "BMXCore",
            targets: [ "BMXCore" ]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/OAuthSwift/OAuthSwift.git", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/infinum/Japx.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "BMXCore",
            url: "https://github.com/runslikebutter/butterflymx-ios-sdk/raw/BMXCore_2.3/BMXCore.zip",
            checksum: "4f6a397cf3256d1686b7d9c6d9b1a6d93edea0415d4fb628c764527d7f107c2d"
        )
    ]
)