// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PassyCorePackage",
    platforms: [.iOS("15.6"), .watchOS("10.6"), .macCatalyst("15.6")],
    products: [
        .library(name: "PassyCore",
                 targets: ["PassyCoreDependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/dotnet/signalr-client-swift.git",
                 exact: "1.0.0")
    ],
    targets: [
        .target(name: "PassyCoreDependencies",
                dependencies: ["PassyAbstractions",
                               "PassyDiagnostics",
                               "PassyCore",
                               "PassySecurity",
                               .product(name: "SignalRClient",
                                        package: "signalr-client-swift",
                                        condition: .when(platforms: [.iOS, .macCatalyst, .macOS]))]),
        .binaryTarget(name: "PassyAbstractions",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.38/PassyAbstractions-1.0.38.xcframework.zip", checksum: "b716157b189752d8161e50951cd153f5756691d38f1d266f82d1ca29d09da294"),
        .binaryTarget(name: "PassyDiagnostics",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.38/PassyDiagnostics-1.0.38.xcframework.zip", checksum: "65b796d111c35cdaa196ae6e9aaa5b690e2f18243f9e99863e4140bead3cd065"),
        .binaryTarget(name: "PassyCore",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.38/PassyCore-1.0.38.xcframework.zip", checksum: "fb986f6b71cda972c289617f784b7825870aafb7c450e0021dfaa71c237cf4a2"),
        .binaryTarget(name: "PassySecurity",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.38/PassySecurity-1.0.38.xcframework.zip", checksum: "f2e357f30ddaf78d6f77faf6758b48ae2557f6b38a5eb2e3d3814ed1a3ade594")
    ]
)
