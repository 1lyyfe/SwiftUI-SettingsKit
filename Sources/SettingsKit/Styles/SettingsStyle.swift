//
//  SettingsStyle.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A global styling object for customizing the appearance of settings components.
///
/// Inject `SettingsStyle` into the environment using `.settingsStyle(...)`
/// to apply consistent fonts, colors, padding, and themes across your entire settings UI.
///
/// - Example:
/// ```swift
/// SettingsSection(header: "General") {
///     SettingsToggleRow(title: "Notifications", isOn: $isOn)
/// }
/// .settingsStyle(SettingsStyle(
///     titleFont: .body,
///     subtitleFont: .caption,
///     titleColor: .primary,
///     subtitleColor: .gray,
///     rowVerticalPadding: 10,
///     destructiveColor: .red,
///     toggleTintColor: .blue
/// ))
/// ```
public struct SettingsStyle {
    /// The font used for all row titles.
    public let titleFont: Font
    
    /// The font used for subtitles, if applicable.
    public let subtitleFont: Font
    
    /// The color for row titles.
    public let titleColor: Color
    
    /// The color for subtitles or secondary text.
    public let subtitleColor: Color
    
    /// Vertical padding inside each row.
    public let rowVerticalPadding: CGFloat
    
    /// The color used for destructive buttons.
    public let destructiveColor: Color
    
    /// The tint color for toggle switches.
    public let toggleTintColor: Color
    
    /// Creates a new settings style instance.
    ///
    /// - Parameters:
    ///   - titleFont: Font for primary row titles.
    ///   - subtitleFont: Font for row subtitles.
    ///   - titleColor: Color for row titles.
    ///   - subtitleColor: Color for subtitles or detail text.
    ///   - rowVerticalPadding: Vertical padding inside rows.
    ///   - destructiveColor: Color used for destructive buttons.
    ///   - toggleTintColor: Tint color for toggle switches.
    
    /// Initializes a new settings style with full customization.
    public init(
        titleFont: Font = .body,
        subtitleFont: Font = .caption,
        titleColor: Color = .primary,
        subtitleColor: Color = .secondary,
        rowVerticalPadding: CGFloat = 4,
        destructiveColor: Color = .red,
        toggleTintColor: Color = .accentColor
    ) {
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.rowVerticalPadding = rowVerticalPadding
        self.destructiveColor = destructiveColor
        self.toggleTintColor = toggleTintColor
    }
    
    /// A default system style.
    public static let `default` = SettingsStyle()
}

/// An environment key for injecting settings style across views.
private struct SettingsStyleKey: EnvironmentKey {
    static let defaultValue = SettingsStyle.default
}

public extension EnvironmentValues {
    var settingsStyle: SettingsStyle {
        get { self[SettingsStyleKey.self] }
        set { self[SettingsStyleKey.self] = newValue }
    }
}

public extension View {
    /// Applies a custom settings style to this view hierarchy.
    func settingsStyle(_ style: SettingsStyle) -> some View {
        environment(\.settingsStyle, style)
    }
}

