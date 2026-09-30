# TUICore_SwiftPM

TUICore 的 SwiftPM 包，内容来自官方源码包（`https://im.sdk.cloud.tencent.cn/download/tuikit/9.0.7652/ios/TUICore.zip`），版本 **9.0.7652**。

```swift
.package(url: "https://github.com/Hanpto/TUICore_SwiftPM.git", from: "9.0.7652")
```

- product：`TUICore_SwiftPM`（模块名 `TUICore`，所以 `import TUICore`）
- 依赖：`Tencent-RTC/Chat_SDK_SwiftPM`（IM）、`SDWebImage`
- 为什么不用 `Tencent-RTC/TUICore_SwiftPM`：那个仓只有 `8.6.7020` 一个 tag，
  且 `Chat_SDK from 8.4.6676` 的上限是 9.0.0，只吃 IM 8.x；本仓按 IM 9.0.x 发。

由 `pod2spm/tools/pod2spm/build_tuicore.py` 生成，不要手工改。
