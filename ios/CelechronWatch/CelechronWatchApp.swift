//
//  CelechronWatchApp.swift
//  CelechronWatch
//
//  手表端宿主 App：首页入口 + deep link 直达日程/付款码 + 地点导航
//

import SwiftUI
import UIKit
import WatchConnectivity
import WidgetKit

@main
struct CelechronWatchApp: App {
    @WKApplicationDelegateAdaptor(WatchAppDelegate.self) var appDelegate
    @State private var path = NavigationPath()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                WatchHomeView()
                    .navigationDestination(for: WatchDeepLink.Destination.self) { dest in
                        switch dest {
                        case .flow:
                            WatchFlowPage()
                        case .ecard:
                            WatchECardPayPage()
                        }
                    }
            }
            .onOpenURL { url in
                if let dest = WatchDeepLink.destination(from: url) {
                    // 重置栈后推入目标页，避免多层叠加
                    path = NavigationPath()
                    path.append(dest)
                }
            }
        }
    }
}

// MARK: - Home

struct WatchHomeView: View {
    @State private var languageCode = NativeLanguage.code

    var body: some View {
        let _ = languageCode
        // 单屏布局：Logo 与系统时间同行；入口用系统图标，不展示具体余额/课程
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(value: WatchDeepLink.Destination.flow) {
                HomeCard(icon: "calendar", title: NativeLanguage.text("日程", "Schedule"))
            }
            .buttonStyle(.plain)
            .accessibilityHint(NativeLanguage.text("打开今日日程列表", "Open today’s schedule"))

            NavigationLink(value: WatchDeepLink.Destination.ecard) {
                HomeCard(icon: "qrcode", title: NativeLanguage.text("付款码", "Pay code"))
            }
            .buttonStyle(.plain)
            .accessibilityHint(NativeLanguage.text("打开校园卡付款码", "Open campus card payment code"))

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 4)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(NotificationCenter.default.publisher(for: WatchDataSync.didUpdateNotification)) { _ in
            languageCode = NativeLanguage.code
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                // 与系统时间同行：约 26pt，避免过小模糊或过大挤占
                AppLogoView()
                    .frame(width: 26, height: 26)
                    .accessibilityLabel("Celechron")
            }
        }
    }
}

private struct AppLogoView: View {
    var body: some View {
        // 优先 Asset Catalog（正确 @1x/@2x/@3x），避免误用松散 PNG 的错误点密度
        Image("AppLogo")
            .resizable()
            .interpolation(.high)
            .scaledToFit()
            .clipShape(Circle())
    }
}

/// 首页入口：系统 SF Symbol + 标题，不展示具体业务数据
private struct HomeCard: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.body)
                .frame(width: 28)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
        .contentShape(Rectangle())
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Flow Page

struct WatchFlowPage: View {
    @State private var flows: [Flow] = []
    @State private var remainingToday = 0
    @State private var languageCode = NativeLanguage.code

    var body: some View {
        let _ = languageCode
        TimelineView(.periodic(from: .now, by: 60)) { context in
            List {
                if flows.isEmpty {
                    Section {
                        VStack(spacing: 6) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.green)
                                .symbolRenderingMode(.hierarchical)
                            Text(NativeLanguage.text("今日无事可做", "Nothing scheduled today"))
                                .font(.headline)
                            Text(NativeLanguage.text("好好休息", "Take a break"))
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .listRowBackground(Color.clear)
                    }
                } else {
                    Section {
                        ForEach(flows) { flow in
                            FlowCard(date: context.date, flow: flow)
                                .listRowInsets(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                .listRowBackground(Color.clear)
                        }
                    } header: {
                        if remainingToday > 0 {
                            Text(NativeLanguage.code == "en" ? "\(remainingToday) more today" : "今日还有 \(remainingToday) 项")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .textCase(nil)
                        }
                    }
                }
            }
            .listStyle(.automatic)
        }
        .navigationTitle(NativeLanguage.text("日程", "Schedule"))
        .onAppear(perform: reload)
        .onReceive(NotificationCenter.default.publisher(for: WatchDataSync.didUpdateNotification)) { _ in
            languageCode = NativeLanguage.code
            reload()
        }
    }

    private func reload() {
        let data = WidgetAppGroup.defaults?.data(forKey: WidgetAppGroup.flowListKey) ?? Data()
        let flowList = (try? JSONDecoder().decode([PeriodDto?].self, from: data)) ?? []
        let now = Date()
        let nowTs = now.timeIntervalSince1970

        var ongoing: [Flow] = []
        var upcoming: [Flow] = []
        for dto in flowList.compactMap({ $0 }) {
            guard let flow = Flow(from: dto) else { continue }
            let end = TimeInterval(dto.endTime)
            let start = TimeInterval(dto.startTime)
            if end <= nowTs { continue }
            if start <= nowTs {
                ongoing.append(flow)
            } else if start - nowTs <= 172_800 {
                upcoming.append(flow)
            }
        }
        ongoing.sort { $0.endTime < $1.endTime }
        upcoming.sort { $0.startTime < $1.startTime }
        flows = ongoing + upcoming

        remainingToday = upcoming.filter {
            Calendar.current.isDate($0.startTime, inSameDayAs: now)
        }.count
    }
}

/// 单条日程卡片：色条 + 标题/地点(可点导航) + 倒计时
private struct FlowCard: View {
    let date: Date
    let flow: Flow
    @Environment(\.openURL) private var openURL

    private var hasBegun: Bool {
        date.compare(flow.startTime) != .orderedAscending
    }

    private var minutesLeft: Int {
        let reference = hasBegun ? flow.endTime : flow.startTime
        return max(0, Int(ceil(date.distance(to: reference) / 60)))
    }

    private var countdownText: String {
        let m = minutesLeft
        if m >= 60 {
            return String(format: "%d:%02d", m / 60, m % 60)
        }
        return NativeLanguage.code == "en" ? "\(m) min" : "\(m) 分"
    }

    private var statusLabel: String {
        hasBegun ? NativeLanguage.text("后结束", "until end") : NativeLanguage.text("后开始", "until start")
    }

    private var accent: Color {
        hasBegun ? .blue : .orange
    }

    private var progress: Double {
        guard hasBegun else { return 0 }
        let total = flow.endTime.timeIntervalSince(flow.startTime)
        guard total > 0 else { return 0 }
        let done = date.timeIntervalSince(flow.startTime)
        return min(1, max(0, done / total))
    }

    private var timeRangeText: String {
        "\(flow.startTime.HHmm24())–\(flow.endTime.HHmm24())"
    }

    private var locationText: String {
        flow.location ?? NativeLanguage.text("无地点", "No location")
    }

    private var canNavigate: Bool {
        WatchDeepLink.mapsURL(for: locationText) != nil
    }

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .fill(accent)
                .frame(width: 4)
                .padding(.vertical, 2)

            VStack(alignment: .leading, spacing: 3) {
                Text(flow.name ?? NativeLanguage.text("未命名日程", "Untitled event"))
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)

                // 地点：可点击跳转 Apple 地图步行导航（热区 ≥ 44pt）
                Button {
                    if let url = WatchDeepLink.mapsURL(for: locationText) {
                        openURL(url)
                    }
                } label: {
                    HStack(spacing: 3) {
                        Image(systemName: canNavigate ? "location.fill" : "location")
                            .font(.caption2)
                        Text(locationText)
                            .font(.caption2)
                            .lineLimit(1)
                        if canNavigate {
                            Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                                .font(.system(size: 9))
                        }
                    }
                    .foregroundStyle(canNavigate ? Color.accentColor : Color.secondary)
                    .frame(maxWidth: .infinity, minHeight: 32, alignment: .leading)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .disabled(!canNavigate)
                .accessibilityLabel(canNavigate ? (NativeLanguage.code == "en" ? "Navigate to \(locationText)" : "导航至\(locationText)") : locationText)
                .accessibilityHint(canNavigate ? NativeLanguage.text("在地图中打开步行路线", "Open walking directions in Maps") : "")

                Text(timeRangeText)
                    .font(.system(.caption2, design: .rounded))
                    .foregroundStyle(.tertiary)

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(countdownText)
                        .font(.system(.title3, design: .rounded).weight(.bold))
                        .foregroundStyle(accent)
                        .monospacedDigit()
                    Text(statusLabel)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                if hasBegun {
                    ProgressView(value: progress)
                        .tint(accent)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 4)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(NativeLanguage.code == "en"
            ? "\(flow.name ?? "Untitled event"), \(countdownText) \(statusLabel), \(timeRangeText)"
            : "\(flow.name ?? "未命名日程")，\(countdownText)\(statusLabel)，\(timeRangeText)")
    }
}

// MARK: - ECard Pay Page (QR)

private enum WatchPayCodeState: Equatable {
    case connecting
    case requesting
    case real
    case demo
    case unavailable(String)
}

struct WatchECardPayPage: View {
    private let ecardService = ECardService()
    private let credentialStore = WatchECardCredentialStore.shared

    @State private var barcode = ""
    @State private var balanceText = NativeLanguage.text("待刷新", "Refresh")
    @State private var qrImage: UIImage?
    @State private var codeState: WatchPayCodeState = .connecting
    @State private var statusMessage = NativeLanguage.text("正在准备付款码", "Preparing pay code")
    @State private var transientRetryCount = 0
    @State private var credentialRefreshAttempted = false
    @State private var phoneFallbackAttempted = false
    @State private var requestSerial = 0
    @State private var languageCode = NativeLanguage.code
    @AccessibilityFocusState private var announceRefresh: Bool

    var body: some View {
        let _ = languageCode
        GeometryReader { geo in
            let side = min(geo.size.width, geo.size.height) * 0.78
            VStack(spacing: 4) {
                Spacer(minLength: 4)

                Button {
                    refreshCode()
                } label: {
                    ZStack {
                        Group {
                            if let qrImage {
                                Image(uiImage: qrImage)
                                    .interpolation(.none)
                                    .resizable()
                                    .scaledToFit()
                            } else if let unavailableMessage {
                                VStack(spacing: 6) {
                                    Image(systemName: "exclamationmark.triangle")
                                        .font(.title3)
                                    Text(unavailableMessage)
                                        .font(.caption2)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.75)
                                }
                                .foregroundStyle(.red)
                                .padding(8)
                            } else {
                                VStack(spacing: 6) {
                                    ProgressView()
                                    Text(statusMessage)
                                        .font(.caption2)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.75)
                                }
                                .foregroundStyle(.gray)
                                .padding(8)
                            }
                        }
                        .frame(width: side, height: side)
                        .padding(3)
                        .background {
                            if qrImage != nil || unavailableMessage != nil {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                            }
                        }
                        .opacity(isShowingDemo ? 0.92 : 1)

                        if isRequesting, qrImage != nil {
                            ProgressView()
                                .tint(.secondary)
                        }
                    }
                }
                .buttonStyle(.plain)
                .frame(minWidth: side, minHeight: side)
                .contentShape(Rectangle())
                .accessibilityLabel(qrAccessibilityLabel)
                .accessibilityHint(NativeLanguage.text("生成新的付款码", "Generate a new pay code"))
                .accessibilityValue(statusMessage)

                if isShowingDemo {
                    Text(NativeLanguage.text("演示码 · 请在 iPhone 登录", "Demo code · Sign in on iPhone"))
                        .font(.caption2)
                        .foregroundStyle(.orange)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                        .accessibilityLabel(NativeLanguage.text("当前为演示码，请在 iPhone 登录校园卡", "Demo code. Sign in to campus card on iPhone."))
                }

                Text(balanceText)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Spacer(minLength: 0)
            }
            .padding(.top, 4)
            .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
        }
        .navigationTitle(NativeLanguage.text("付款码", "Pay code"))
        .onAppear {
            reloadBalance()
            refreshCode()
        }
        .onReceive(NotificationCenter.default.publisher(for: WatchDataSync.didUpdateNotification)) { _ in
            languageCode = NativeLanguage.code
            reloadBalance()
            statusMessage = NativeLanguage.relocalized(statusMessage)
            if case let .unavailable(message) = codeState {
                codeState = .unavailable(NativeLanguage.relocalized(message))
            }
            retryBarcodeIfReady()
        }
        .onDisappear {
            // Invalidate pending callbacks and release the payment code/image.
            requestSerial += 1
            barcode = ""
            qrImage = nil
        }
    }

    private func reloadBalance() {
        let defaults = WidgetAppGroup.defaults
        if defaults?.object(forKey: WidgetAppGroup.ecardBalanceKey) == nil {
            balanceText = ECardBalanceFormatter.string(from: -1)
        } else {
            let balance = defaults?.integer(forKey: WidgetAppGroup.ecardBalanceKey) ?? -1
            balanceText = ECardBalanceFormatter.string(from: balance)
        }
    }

    private var isShowingDemo: Bool {
        codeState == .demo
    }

    private var isRequesting: Bool {
        codeState == .requesting
    }

    private var unavailableMessage: String? {
        guard case let .unavailable(message) = codeState else { return nil }
        return message
    }

    private var qrAccessibilityLabel: String {
        switch codeState {
        case .demo: return NativeLanguage.text("演示付款码，点按刷新", "Demo pay code. Tap to refresh.")
        case .real: return NativeLanguage.text("校园卡付款码，点按刷新", "Campus card pay code. Tap to refresh.")
        case .connecting, .requesting: return NativeLanguage.text("正在获取校园卡付款码", "Getting campus card pay code")
        case .unavailable: return NativeLanguage.text("付款码暂不可用，点按重试", "Pay code unavailable. Tap to retry.")
        }
    }

    private func refreshCode() {
        transientRetryCount = 0
        credentialRefreshAttempted = false
        phoneFallbackAttempted = false
        requestSerial += 1
        let serial = requestSerial
        qrImage = nil
        barcode = ""
        codeState = .requesting
        statusMessage = NativeLanguage.text("正在获取付款码", "Getting pay code")
        resolveCredentialAndFetch(serial: serial)
    }

    private func applyBarcode(_ code: String, isDemo: Bool) {
        barcode = code
        qrImage = SimpleQRCode.image(from: code, size: 240)
        if qrImage == nil {
            setUnavailable(NativeLanguage.text("付款码过长\n请在 iPhone 打开", "Code too long\nOpen on iPhone"))
        } else {
            codeState = isDemo ? .demo : .real
            statusMessage = isDemo ? NativeLanguage.text("已刷新演示码", "Demo code refreshed") : NativeLanguage.text("已刷新付款码", "Pay code refreshed")
            transientRetryCount = 0
        }
        announceRefresh = true
    }

    private func setUnavailable(_ message: String) {
        barcode = ""
        qrImage = nil
        codeState = .unavailable(message)
        statusMessage = message.replacingOccurrences(of: "\n", with: NativeLanguage.code == "en" ? ", " : "，")
    }

    private func resolveCredentialAndFetch(serial: Int) {
        guard serial == requestSerial else { return }
        if let credential = credentialStore.load(), !credential.needsRefresh {
            fetchDirectlyFromWatch(credential: credential, serial: serial)
            return
        }
        let needsRefresh = credentialStore.load()?.needsRefresh == true
        if needsRefresh {
            credentialRefreshAttempted = true
        }
        requestCredentialFromPhone(refresh: needsRefresh, serial: serial)
    }

    private func fetchDirectlyFromWatch(credential: WatchECardCredential, serial: Int) {
        guard serial == requestSerial else { return }
        codeState = .requesting
        statusMessage = NativeLanguage.text("正在通过 Watch 网络获取", "Getting code on Watch")
        // Always fetch getCampusCards on Watch. Besides validating the account,
        // this supplies the real balance without relying on WidgetKit timing.
        ecardService.fetchPayCode(auth: credential.auth, cachedAccount: nil) { result in
            DispatchQueue.main.async {
                guard serial == self.requestSerial else { return }
                switch result {
                case let .success(payCode):
                    var updated = credential
                    updated.account = payCode.account
                    updated.needsRefresh = false
                    _ = self.credentialStore.save(updated)
                    if let balance = payCode.balance {
                        let defaults = WidgetAppGroup.defaults
                        defaults?.set(balance, forKey: WidgetAppGroup.ecardBalanceKey)
                        defaults?.set(Date(), forKey: WidgetAppGroup.ecardUpdateTimeKey)
                        self.balanceText = ECardBalanceFormatter.string(from: balance)
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    self.applyBarcode(payCode.code, isDemo: false)
                case .failure(.authenticationExpired):
                    self.credentialStore.markNeedsRefresh()
                    guard !self.credentialRefreshAttempted else {
                        self.setUnavailable(NativeLanguage.text("授权已失效\n请在 iPhone 重新登录", "Session expired\nSign in on iPhone"))
                        return
                    }
                    self.credentialRefreshAttempted = true
                    self.requestCredentialFromPhone(refresh: true, serial: serial)
                case .failure(.transientFailure):
                    self.handleDirectTransientFailure(credential: credential, serial: serial)
                case .failure(.invalidResponse), .failure(.noCards), .failure(.noBarcode):
                    self.setUnavailable(NativeLanguage.text("服务返回异常\n点按重试", "Service error\nTap to retry"))
                }
            }
        }
    }

    private func handleDirectTransientFailure(credential: WatchECardCredential, serial: Int) {
        guard transientRetryCount < 1 else {
            requestBarcodeFromPhoneFallback(serial: serial, unavailableMessage: NativeLanguage.text("网络请求失败\n点按重试", "Network error\nTap to retry"))
            return
        }
        transientRetryCount += 1
        codeState = .requesting
        statusMessage = NativeLanguage.text("网络不稳定，正在重试", "Network unstable. Retrying")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            guard serial == self.requestSerial else { return }
            self.fetchDirectlyFromWatch(credential: credential, serial: serial)
        }
    }

    private func requestCredentialFromPhone(refresh: Bool, serial: Int) {
        guard WCSession.isSupported() else {
            setCredentialUnavailable(refresh: refresh)
            return
        }
        let session = WCSession.default
        guard session.activationState == .activated else {
            // 表盘 deep link 会在 WCSession 完成冷启动前进入本页。
            // 保留当前画面，由 activationDidComplete 通知触发自动重试。
            codeState = .connecting
            statusMessage = NativeLanguage.text("正在连接 iPhone", "Connecting to iPhone")
            return
        }
        guard session.isReachable else {
            setCredentialUnavailable(refresh: refresh)
            return
        }

        codeState = .requesting
        statusMessage = refresh ? NativeLanguage.text("正在通过 iPhone 更新授权", "Updating access via iPhone") : NativeLanguage.text("正在从 iPhone 配置授权", "Setting up access via iPhone")
        session.sendMessage(
            ["action": refresh ? "refreshPayCredential" : "requestPayCredential"],
            replyHandler: { reply in
                DispatchQueue.main.async {
                    guard serial == self.requestSerial else { return }
                    if let credential = WatchECardCredentialMessage.credential(from: reply) {
                        self.phoneFallbackAttempted = false
                        switch WatchECardCredentialMessage.accept(credential) {
                        case .success:
                            self.fetchDirectlyFromWatch(credential: credential, serial: serial)
                        case .failure(.passcodeRequired):
                            // Independent storage is unavailable without a Watch
                            // passcode, but the existing live iPhone fallback remains usable.
                            self.requestBarcodeFromPhoneFallback(
                                serial: serial,
                                unavailableMessage: NativeLanguage.text("请先为 Watch 设置密码", "Set a Watch passcode first")
                            )
                        case .failure:
                            self.setUnavailable(NativeLanguage.text("无法安全保存授权\n点按重试", "Could not save access\nTap to retry"))
                        }
                    } else if (reply["loggedIn"] as? Bool) == false {
                        self.requestBarcodeFromPhoneFallback(
                            serial: serial,
                            unavailableMessage: NativeLanguage.text("请在 iPhone 登录", "Sign in on iPhone")
                        )
                    } else if refresh {
                        self.setUnavailable(NativeLanguage.text("授权更新失败\n请在 iPhone 重新登录", "Access update failed\nSign in on iPhone"))
                    } else {
                        self.requestBarcodeFromPhoneFallback(
                            serial: serial,
                            unavailableMessage: NativeLanguage.text("获取失败\n点按重试", "Could not get code\nTap to retry")
                        )
                    }
                }
            },
            errorHandler: { _ in
                DispatchQueue.main.async {
                    guard serial == self.requestSerial else { return }
                    if let credential = self.credentialStore.load(), !credential.needsRefresh {
                        self.fetchDirectlyFromWatch(credential: credential, serial: serial)
                    } else {
                        self.setCredentialUnavailable(refresh: refresh)
                    }
                }
            }
        )
    }

    private func requestBarcodeFromPhoneFallback(serial: Int, unavailableMessage: String) {
        guard !phoneFallbackAttempted else {
            setUnavailable(unavailableMessage)
            return
        }
        phoneFallbackAttempted = true
        guard WCSession.isSupported() else {
            setUnavailable(unavailableMessage)
            return
        }
        let session = WCSession.default
        guard session.activationState == .activated, session.isReachable else {
            setUnavailable(unavailableMessage)
            return
        }
        codeState = .requesting
        statusMessage = NativeLanguage.text("正在通过 iPhone 获取", "Getting code via iPhone")
        session.sendMessage(
            ["action": "requestPayCode"],
            replyHandler: { reply in
                DispatchQueue.main.async {
                    guard serial == self.requestSerial else { return }
                    if let credential = WatchECardCredentialMessage.credential(from: reply) {
                        _ = WatchECardCredentialMessage.accept(credential)
                    }
                    if let code = reply["barcode"] as? String, !code.isEmpty {
                        self.applyBarcode(code, isDemo: (reply["isDemo"] as? Bool) ?? false)
                    } else if (reply["needsRefresh"] as? Bool) == true,
                              !self.credentialRefreshAttempted
                    {
                        self.credentialStore.markNeedsRefresh()
                        self.credentialRefreshAttempted = true
                        self.requestCredentialFromPhone(refresh: true, serial: serial)
                    } else {
                        self.setUnavailable(unavailableMessage)
                    }
                }
            },
            errorHandler: { _ in
                DispatchQueue.main.async {
                    guard serial == self.requestSerial else { return }
                    self.setUnavailable(unavailableMessage)
                }
            }
        )
    }

    private func setCredentialUnavailable(refresh: Bool) {
        if refresh {
            setUnavailable(NativeLanguage.text("授权已失效\n请连接 iPhone 刷新", "Session expired\nConnect to iPhone"))
        } else {
            setUnavailable(NativeLanguage.text("尚未配置授权\n请连接 iPhone", "Access not set up\nConnect to iPhone"))
        }
    }

    /// 表盘直达会让页面早于 WCSession 就绪；就绪后自动补请付款码。
    private func retryBarcodeIfReady() {
        guard codeState != .requesting, codeState != .real else { return }
        if let credential = credentialStore.load(), !credential.needsRefresh {
            refreshCode()
            return
        }
        guard WCSession.isSupported() else { return }
        let session = WCSession.default
        guard session.activationState == .activated, session.isReachable else { return }
        refreshCode()
    }
}

// MARK: - App Delegate / WatchConnectivity

final class WatchAppDelegate: NSObject, WKApplicationDelegate, WCSessionDelegate {
    func applicationDidFinishLaunching() {
        activateSession()
        #if DEBUG
        removeLegacyPreviewDataIfNeeded()
        #endif
    }

    private func activateSession() {
        guard WCSession.isSupported() else { return }
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }

    #if DEBUG
    private func removeLegacyPreviewDataIfNeeded() {
        let defaults = WidgetAppGroup.defaults
        let migrationKey = "removedRuntimePreviewDataV1"
        guard defaults?.bool(forKey: migrationKey) != true else { return }

        // Earlier Debug builds wrote 18.97 and sample schedules into persistent
        // App Group storage. Clear that one known synthetic value once so it
        // cannot survive an upgrade and masquerade as a server response.
        if defaults?.integer(forKey: WidgetAppGroup.ecardBalanceKey) == 1897 {
            defaults?.removeObject(forKey: WidgetAppGroup.ecardBalanceKey)
            defaults?.removeObject(forKey: WidgetAppGroup.ecardUpdateTimeKey)
        }
        if let data = defaults?.data(forKey: WidgetAppGroup.flowListKey),
           let periods = try? JSONDecoder().decode([PeriodDto?].self, from: data),
           periods.compactMap({ $0?.uid }).contains(where: { $0.hasPrefix("preview-") })
        {
            defaults?.removeObject(forKey: WidgetAppGroup.flowListKey)
        }
        defaults?.set(true, forKey: migrationKey)
        WidgetCenter.shared.reloadAllTimelines()
        WatchDataSync.notifyUpdated()
    }
    #endif

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        if activationState == .activated {
            applyApplicationContext(session.receivedApplicationContext)
            DispatchQueue.main.async {
                WatchDataSync.notifyUpdated()
            }
        }
    }

    func sessionReachabilityDidChange(_ session: WCSession) {
        DispatchQueue.main.async {
            WatchDataSync.notifyUpdated()
        }
    }

    func session(
        _ session: WCSession,
        didReceiveApplicationContext applicationContext: [String: Any]
    ) {
        applyApplicationContext(applicationContext)
    }

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
        applyApplicationContext(userInfo)
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        handleMessage(message, replyHandler: nil)
    }

    func session(
        _ session: WCSession,
        didReceiveMessage message: [String: Any],
        replyHandler: @escaping ([String: Any]) -> Void
    ) {
        handleMessage(message, replyHandler: replyHandler)
    }

    private func handleMessage(
        _ message: [String: Any],
        replyHandler: (([String: Any]) -> Void)?
    ) {
        if let action = message["action"] as? String {
            if action == WatchECardCredentialMessage.revokeAction {
                WatchECardCredentialStore.shared.delete()
                WidgetAppGroup.defaults?.set(false, forKey: WidgetAppGroup.ecardLoggedInKey)
                DispatchQueue.main.async { WatchDataSync.notifyUpdated() }
                replyHandler?(["ok": true])
                return
            }
            if action == WatchECardCredentialMessage.provisionAction,
               let credential = WatchECardCredentialMessage.credential(from: message)
            {
                switch WatchECardCredentialMessage.accept(credential) {
                case .success:
                    WidgetAppGroup.defaults?.set(true, forKey: WidgetAppGroup.ecardLoggedInKey)
                    DispatchQueue.main.async { WatchDataSync.notifyUpdated() }
                    replyHandler?(["ok": true])
                case .failure(.passcodeRequired):
                    replyHandler?(["ok": false, "error": "passcodeRequired"])
                case .failure:
                    replyHandler?(["ok": false, "error": "keychainFailure"])
                }
                return
            }
        }
        applyApplicationContext(message)
        replyHandler?(["ok": true])
    }

    private func applyApplicationContext(_ context: [String: Any]) {
        guard !context.isEmpty else { return }
        let defaults = WidgetAppGroup.defaults

        if let languageCode = context[NativeLanguage.key] as? String {
            NativeLanguage.set(languageCode)
        }

        if let flowData = context["flowList"] as? Data {
            defaults?.set(flowData, forKey: WidgetAppGroup.flowListKey)
        } else if let flowBase64 = context["flowListBase64"] as? String,
                  let flowData = Data(base64Encoded: flowBase64)
        {
            defaults?.set(flowData, forKey: WidgetAppGroup.flowListKey)
        }

        if let balance = context["ecardBalance"] as? Int {
            defaults?.set(balance, forKey: WidgetAppGroup.ecardBalanceKey)
            defaults?.set(Date(), forKey: WidgetAppGroup.ecardUpdateTimeKey)
        } else if let balance = context["ecardBalance"] as? NSNumber {
            defaults?.set(balance.intValue, forKey: WidgetAppGroup.ecardBalanceKey)
            defaults?.set(Date(), forKey: WidgetAppGroup.ecardUpdateTimeKey)
        }

        if let ts = context["ecardUpdateTime"] as? TimeInterval {
            defaults?.set(Date(timeIntervalSince1970: ts), forKey: WidgetAppGroup.ecardUpdateTimeKey)
        }

        if let loggedIn = context["ecardLoggedIn"] as? Bool {
            defaults?.set(loggedIn, forKey: WidgetAppGroup.ecardLoggedInKey)
            if !loggedIn {
                WatchECardCredentialStore.shared.delete()
            }
        } else if let loggedIn = context["ecardLoggedIn"] as? NSNumber {
            defaults?.set(loggedIn.boolValue, forKey: WidgetAppGroup.ecardLoggedInKey)
            if !loggedIn.boolValue {
                WatchECardCredentialStore.shared.delete()
            }
        }

        WidgetCenter.shared.reloadAllTimelines()
        DispatchQueue.main.async {
            WatchDataSync.notifyUpdated()
        }
    }
}
