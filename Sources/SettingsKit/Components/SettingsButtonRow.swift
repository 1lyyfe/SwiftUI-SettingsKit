//
//  SettingsButtonRow.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A settings row that performs an action when tapped.
///
/// Use this component for destructive or non-navigational actions,
/// like logging out, clearing cache, or resetting preferences.
///
/// - Example:
/// ```swift
/// SettingsButtonRow(title: "Log Out", role: .destructive) {
///     logout()
/// }
/// ```
public struct SettingsButtonRow: View {
    public let title: String
    public let role: ButtonRole?
    public let action: () -> Void
    @Environment(\.settingsStyle) private var style
    
    /// Initializes a new `SettingsButtonRow`.
    ///
    /// - Parameters:
    ///   - title: The title displayed in the row.
    ///   - role: Optional button role (`.destructive`, `.cancel`, etc).
    ///   - action: Closure executed when the row is tapped.
    public init(title: String, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
    
    public var body: some View {
        Button(role: role, action: action) {
            Text(title)
                .font(style.titleFont)
                .foregroundColor(role == .destructive ? style.destructiveColor : style.titleColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, style.rowVerticalPadding)
        }
        .contentShape(Rectangle())
    }
}
