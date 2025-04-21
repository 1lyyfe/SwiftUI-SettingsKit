//
//  SettingsStyle.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A configuration struct for customizing the visual style of SettingsKit components.
///
/// Override this to change fonts, colors, padding, and more throughout the settings UI.
public struct SettingsStyle {
    public var titleFont: Font
    public var subtitleFont: Font
    public var titleColor: Color
    public var subtitleColor: Color
    public var rowVerticalPadding: CGFloat
    public var destructiveColor: Color
    public var toggleTintColor: Color

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

