//
//  SettingsNavigationRow.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A settings row that navigates to another destination when tapped.
///
/// Typically used to link to detail or sub-settings screens.
public struct SettingsNavigationRow<Destination: View>: View {
    private let title: String
    private let subtitle: String?
    private let destination: Destination
    @Environment(\.settingsStyle) private var style
    
    /// Initializes a new `SettingsNavigationRow`.
    ///
    /// - Parameters:
    ///   - title: The title displayed in the row.
    ///   - subtitle: Optional subtitle below the title.
    ///   - destination: The view to navigate to when tapped.
    public init(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder destination: () -> Destination
    ) {
        self.title = title
        self.subtitle = subtitle
        self.destination = destination()
    }
    
    public var body: some View {
        NavigationLink(destination: destination) {
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
            .padding(.vertical, style.rowVerticalPadding)
        }
    }
}
