// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PassyCorePackage",
    platforms: [.iOS(.v17), .watchOS("10.6"), .macCatalyst(.v17)],
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
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.37/PassyAbstractions-1.0.37.xcframework.zip", checksum: "f632328f8c263b17cb494df94d93c2b3a57e2536f4add69d22f2a8bbde97a647"),
        .binaryTarget(name: "PassyDiagnostics",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.37/PassyDiagnostics-1.0.37.xcframework.zip", checksum: "40102f387d50e527dd51e8b5ebae61f1ed99c11b1bd803d83304966cd81afa89"),
        .binaryTarget(name: "PassyCore",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.37/PassyCore-1.0.37.xcframework.zip", checksum: "cb70094639d352aff8f685cf247b5d80929e46fff4ccc44400b4ec05ab03464a"),
        .binaryTarget(name: "PassySecurity",
                      url: "https://github.com/PassySRL/PassyCorePackage/releases/download/1.0.37/PassySecurity-1.0.37.xcframework.zip", checksum: "4a461c9526f2ded36ca72f3c897e53a5efb7352a7d9ee071795ca706d76052b3")
    ]
)
