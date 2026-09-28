import Foundation

/// App-selected language shared by the phone, widgets, and Watch. It is never
/// stored with credentials, so logging out does not reset the user's choice.
enum NativeLanguage {
    static let key = "appLanguageCode"

    private static var defaults: UserDefaults? {
        #if DEBUG
        UserDefaults(suiteName: "group.top.celechron.celechron.debug")
        #else
        UserDefaults(suiteName: "group.top.celechron.celechron")
        #endif
    }

    static var code: String {
        defaults?.string(forKey: key) == "en" ? "en" : "zh"
    }

    @discardableResult
    static func set(_ code: String) -> Bool {
        guard code == "en" || code == "zh" else { return false }
        defaults?.set(code, forKey: key)
        return true
    }

    static func text(_ chinese: String, _ english: String) -> String {
        code == "en" ? english : chinese
    }

    /// Reformat a visible Watch status after the phone changes language while
    /// this page is open. State stores the displayed string for VoiceOver too.
    static func relocalized(_ current: String) -> String {
        let pairs: [(String, String)] = [
            ("正在准备付款码", "Preparing pay code"),
            ("正在获取付款码", "Getting pay code"),
            ("付款码过长\n请在 iPhone 打开", "Code too long\nOpen on iPhone"),
            ("已刷新演示码", "Demo code refreshed"),
            ("已刷新付款码", "Pay code refreshed"),
            ("正在通过 Watch 网络获取", "Getting code on Watch"),
            ("授权已失效\n请在 iPhone 重新登录", "Session expired\nSign in on iPhone"),
            ("服务返回异常\n点按重试", "Service error\nTap to retry"),
            ("网络请求失败\n点按重试", "Network error\nTap to retry"),
            ("网络不稳定，正在重试", "Network unstable. Retrying"),
            ("正在连接 iPhone", "Connecting to iPhone"),
            ("正在通过 iPhone 更新授权", "Updating access via iPhone"),
            ("正在从 iPhone 配置授权", "Setting up access via iPhone"),
            ("请先为 Watch 设置密码", "Set a Watch passcode first"),
            ("无法安全保存授权\n点按重试", "Could not save access\nTap to retry"),
            ("请在 iPhone 登录", "Sign in on iPhone"),
            ("授权更新失败\n请在 iPhone 重新登录", "Access update failed\nSign in on iPhone"),
            ("获取失败\n点按重试", "Could not get code\nTap to retry"),
            ("正在通过 iPhone 获取", "Getting code via iPhone"),
            ("授权已失效\n请连接 iPhone 刷新", "Session expired\nConnect to iPhone"),
            ("尚未配置授权\n请连接 iPhone", "Access not set up\nConnect to iPhone"),
        ]
        for (chinese, english) in pairs {
            if current == chinese || current == english {
                return text(chinese, english)
            }
            let inlineChinese = chinese.replacingOccurrences(of: "\n", with: "，")
            let inlineEnglish = english.replacingOccurrences(of: "\n", with: ", ")
            if current == inlineChinese || current == inlineEnglish {
                return text(inlineChinese, inlineEnglish)
            }
        }
        return current
    }
}
