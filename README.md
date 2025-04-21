# ⚙️ SwiftUI Settings Kit

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

| Light Mode | Dark Mode |
|------------|-----------|
| <img src="https://github.com/user-attachments/assets/3529c6d8-b54c-46b3-bc03-04c84ae6021d" height="400" /> | <img src="https://github.com/user-attachments/assets/e05e7c91-fb2a-4299-b80e-b676d6923160" height="400" /> |

---

## 🧱 Components + Usages

```swift
@State private var isOn = true
@State private var isOn2 = false
@State private var isDev = false
@State private var showAdvanced = true

SettingsSection(header: "General") {
    SettingsToggleRow(title: "Enable Notifications", isOn: $isOn)
    SettingsToggleRow(title: "Background Sync", subtitle: "Keeps data updated in background", isOn: $isOn2)
}

SettingsNavigationRow(title: "Appearance") {
    AppearanceScreen()
}

SettingsDisclosureGroup(title: "Advanced", isExpanded: $showAdvanced) {
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

You can use [Swift Package Manager](https://swift.org/package-manager/) to install **SettingsKit** in your project.

### Using Xcode:

1. Open your project in Xcode
2. Go to **File > Add Packages**
3. Enter this URL: [https://github.com/1lyyfe/SwiftUI-SettingsKit](https://github.com/1lyyfe/SwiftUI-SettingsKit)
4. Select version **from: 1.0.0**

---

### Or via `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/1lyyfe/SwiftUI-SettingsKit.git", from: "1.0.0")
]
```

Then add "SettingsKit" to your target dependencies.

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
