//
//  SettingsSection.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A container for grouping related settings rows under an optional section header.
///
/// Typically used inside a `Form` or `List` to organize settings into logical sections.
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
