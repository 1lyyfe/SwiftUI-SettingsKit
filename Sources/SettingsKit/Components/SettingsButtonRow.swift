//
//  SettingsButtonRow.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A tappable settings row used for actions like logout or reset.
///
/// Can be styled with optional `role` to indicate destructive intent.
public struct SettingsButtonRow: View {
    private let title: String
    private let role: ButtonRole?
    private let action: () -> Void
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
