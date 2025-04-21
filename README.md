# 🧰 SwiftUI Settings Kit

A clean, customizable, and production-ready **settings UI kit** for iOS apps — built entirely in **SwiftUI**.

This open-source library gives you polished components to build beautiful settings screens fast:

- ✅ Sections
- ✅ Toggles
- ✅ Disclosure groups
- ✅ Navigation rows
- ✅ Action buttons
- ✅ Theme-aware styles

---

## ✨ Features

- 🍎 Native SwiftUI 5 implementation
- 🎨 Configurable design via `SettingsStyle`
- 🧩 Modular, reusable views
- 🧱 Composable architecture for building real-world settings screens
- 🌙 Dark mode support out of the box

---

## 📸 Preview

| Section + Toggles | Navigation & Disclosure | Action Button |
|------------------|--------------------------|----------------|
| ![](Gifs/toggles.gif) | ![](Gifs/nav-disclosure.gif) | ![](Gifs/button.gif) |

> Note: Preview layout and gif file names should match your actual assets.

---

## 🧱 Components

```swift
SettingsSection(header: "General") {
    SettingsToggleRow(title: "Enable Notifications", isOn: $isOn)
    SettingsToggleRow(title: "Background Sync", subtitle: "Keeps data updated in background", isOn: $isOn2)
}

SettingsNavigationRow(title: "Appearance") {
    AppearanceScreen()
}

SettingsDisclosureGroup(title: "Advanced") {
    SettingsToggleRow(title: "Enable Dev Mode", isOn: $isDev)
}

SettingsButtonRow(title: "Log Out", role: .destructive) {
    logout()
}
```

---

## 🎨 Styling with `SettingsStyle`

You can globally customize appearance by injecting a style into the environment:

```swift
.settingsStyle(
    SettingsStyle(
        titleFont: .callout,
        subtitleFont: .caption,
        titleColor: .primary,
        subtitleColor: .gray,
        rowVerticalPadding: 6,
        destructiveColor: .red,
        toggleTintColor: .blue
    )
)
```

All components will adapt automatically via `@Environment(\.settingsStyle)`.

---

## 🧪 Tests

This library includes a **fully documented test suite** using `XCTest` to validate all components:

- ✅ `SettingsToggleRowTests`
- ✅ `SettingsNavigationRowTests`
- ✅ `SettingsButtonRowTests`
- ✅ `SettingsDisclosureGroupTests`

### ✅ Running Tests

To run tests for the core `SettingsKit` package:

#### 🛠 If you're using Xcode:
1. **Open `Package.swift` directly** in Xcode (not the demo app (`SettingsKitDemo`) project (in the `Examples` folder))
2. Select the `SettingsKitTests` scheme
3. Press `⌘ + U` to run tests

> ❗️Note: If you open the demo app (`SettingsKitDemo.xcodeproj`) instead of the package, `⌘ + U` will only run demo app tests — not the actual library tests.

#### 🧪 Or run via terminal:

```bash
cd path/to/SwiftUI-SettingsKit
swift test
```

---

This will build and run the full suite from the Tests/SettingsKitTests folder.

### 🔍 Note on Test Philosophy
All tests are written without using fragile reflection. We simulate real SwiftUI usage through state and bindings to ensure reliability and future-proofing.

**Example from `SettingsDisclosureGroupTests.swift`:**

```swift
func testDisclosureGroupHonorsBinding() {
    var isExpanded = false
    let binding = Binding<Bool>(
        get: { isExpanded },
        set: { isExpanded = $0 }
    )

    let group = SettingsDisclosureGroup(title: "Debug", isExpanded: binding) {
        Text("Advanced Settings")
    }

    XCTAssertFalse(isExpanded)
}
```

---
## 🧪 Example App

The included demo app shows how to use every component in a real SwiftUI project:

```swift
@main
struct SettingsKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsPreviewScreen()
        }
    }
}
```

> Check out `SettingsPreviewScreen.swift` inside `SettingsKitDemo/` to try the components live.

---

## 📦 Installation

Coming soon via Swift Package Manager (SPM)

---

## 📘 License

MIT

---

## 💡 Author

Built with ❤️ by [Haider Ashfaq](https://github.com/1lyyfe)

---

## 👉 Also from me

Want inspiration for your next indie iOS app?

**💡 Check out [100 iOS App Ideas with MVP Scopes](https://heeydurh.gumroad.com/l/hwfkko)** — a high-value guide made for SwiftUI engineers.

---

## 🔔 Follow for More

Follow [Haider on Medium](https://medium.com/@haiderashfaq) for upcoming articles, deeper SwiftUI dives, and full-stack dev projects.

---

Happy shipping 🚀   
