//
//  SettingsSection.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A reusable container for grouping related settings rows with an optional header.
///
/// Use `SettingsSection` to visually group settings within a form or screen.
/// You can provide a header string (optional), and any content as a view builder.
///
/// - Example:
/// ```swift
/// SettingsSection(header: "Notifications") {
///     SettingsToggleRow(title: "Enable Alerts", isOn: $alertsEnabled)
///     SettingsToggleRow(title: "Sounds", isOn: $soundEnabled)
/// }
/// ```
public struct SettingsSection<Content: View>: View {
    public let header: String?
    public let content: Content
    
    /// Initializes a new `SettingsSection`.
    ///
    /// - Parameters:
    ///   - header: An optional section header string.
    ///   - content: A view builder closure providing the section's content.
    public init(header: String? = nil, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    public var body: some View {
        Section(header: headerView) {
            content
        }
    }
    
    @ViewBuilder
    private var headerView: some View {
        if let header = header {
            Text(header)
                .font(.headline)
                .foregroundColor(.secondary)
                .textCase(nil)
                .padding(.top, 8)
        }
    }
}
