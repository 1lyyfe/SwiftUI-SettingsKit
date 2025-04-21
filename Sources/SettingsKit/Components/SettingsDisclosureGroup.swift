//
//  SettingsDisclosureGroup.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A collapsible section of settings rows using a `DisclosureGroup`.
///
/// Can be used to nest related settings in an expandable section.
public struct SettingsDisclosureGroup<Content: View>: View {
    private let title: String
    private let content: Content
    
    @State private var isExpanded: Bool = false
    @Environment(\.settingsStyle) private var style
    
    /// Initializes a new `SettingsDisclosureGroup`.
    ///
    /// - Parameters:
    ///   - title: The title for the collapsed/expanded section.
    ///   - content: The settings rows shown when expanded.
    public init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    public var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                VStack(alignment: .leading, spacing: 0) {
                    content
                }
                .padding(.leading, 2)
            },
            label: {
                Text(title)
                    .font(style.titleFont)
                    .foregroundColor(style.titleColor)
            }
        )
        .padding(.vertical, style.rowVerticalPadding)
    }
}
