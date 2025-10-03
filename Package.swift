// 각각 게임에 OpenAPI가 다르기에 추가 된 패키지 입니다.
// 해당 패키지는 DnF 관련 DTO, Request model 등 포함합니다.
//
// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MapleKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MapleKit",
            targets: ["MapleKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3")
    ],
    targets: [
        .target(
            name: "MapleKit",
            dependencies: [
                .product(name: "Moya", package: "Moya")
            ]
        ),
        .testTarget(name: "DnFKitTests", dependencies: ["MapleKit"])
    ]
)
