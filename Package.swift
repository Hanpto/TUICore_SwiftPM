// swift-tools-version:6.0
import PackageDescription

// 本包由 tools/pod2spm/build_tuicore.py 生成，内容来自官方源码包：
//   https://im.sdk.cloud.tencent.cn/download/tuikit/9.0.7652/ios/TUICore.zip
// 版本号跟 IM 对齐；依赖与官方 TUICore.podspec 的 ImSDK_Plus subspec 一致。
let package = Package(
    name: "TUICore_SwiftPM",
    platforms: [.iOS(.v13)],
    products: [
        // product 名与官方壳仓库（Tencent-RTC/TUICore_SwiftPM）保持一致，
        // 将来迁回官方仓时客户的 .product(name:) 不用改
        .library(name: "TUICore_SwiftPM", targets: ["TUICore"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.0.7652"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.0.1")
    ],
    targets: [
        .target(
            // target 名就是模块名，客户写 import TUICore
            name: "TUICore",
            dependencies: [
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "SDWebImage", package: "SDWebImage")
            ],
            path: "Sources/TUICore",
            // 头文件与实现同目录（官方 podspec 把它们全列进 source_files），
            // 全部作为公开头，与 CocoaPods 下的可见性一致
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
