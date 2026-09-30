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
            // 头文件必须放在 include/ 子目录里，不能与实现同目录：
            // 同目录时 SwiftPM 会因为存在与 target 同名的 TUICore.h 而生成
            // `umbrella header "TUICore.h"`，只有 TUICore.h 收进去的头才可见，
            // TUIGlobalization.h / UIColor+TUIHexColor.h 这些就丢了（客户会报
            // cannot find 'TUIGlobalization' / UIColor has no member 'tui_color'）。
            // 放子目录后 SwiftPM 生成目录式 umbrella，所有头都公开——与 CocoaPods
            // 生成的 <Pod>-umbrella.h（把所有 public header 全 #import）一致。
            publicHeadersPath: "include",
            cSettings: [
                // 实现文件里是 #import "TUIDefine.h" 这种引号引用，
                // 头搬到 include/ 后要靠这条找到
                .headerSearchPath("include")
            ]
        )
    ]
)
