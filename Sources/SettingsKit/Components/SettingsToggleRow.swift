//
//  SettingsToggleRow.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A settings row with a toggle switch.
///
/// Use this component for boolean preferences, like enabling notifications or dark mode.
///
/// - Example:
/// ```swift
/// SettingsToggleRow(title: "Enable Notifications", isOn: $notificationsEnabled)
/// ```
///
/// You can also provide a subtitle for context:
/// ```swift
/// SettingsToggleRow(
///     title: "Background Sync",
///     subtitle: "Keeps your data up to date",
///     isOn: $syncEnabled
/// )
/// ```
public struct SettingsToggleRow: View {
    public let title: String
    public let subtitle: String?
    @Binding private var isOn: Bool
    @Environment(\.settingsStyle) private var style
    
    /// Initializes a new `SettingsToggleRow`.
    ///
    /// - Parameters:
    ///   - title: The main label displayed.
    ///   - subtitle: Optional detail text shown below the title.
    ///   - isOn: A binding to the boolean state of the toggle.
    public init(title: String, subtitle: String? = nil, isOn: Binding<Bool>) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(style.titleFont)
                    .foregroundColor(style.titleColor)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(style.subtitleFont)
                        .foregroundColor(style.subtitleColor)
                }
            }
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .toggleStyle(.switch)
                .tint(style.toggleTintColor)
                .labelsHidden()
        }
        .contentShape(Rectangle())
        .padding(.vertical, style.rowVerticalPadding)
    }
}
