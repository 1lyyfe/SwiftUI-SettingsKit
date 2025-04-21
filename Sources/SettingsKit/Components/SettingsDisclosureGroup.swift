//
//  SettingsDisclosureGroup.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI

/// A collapsible, expandable section for related settings.
///
/// Use `SettingsDisclosureGroup` to group related rows under a tappable,
/// expandable heading. Ideal for advanced or optional settings.
///
/// Pass a `Binding<Bool>` to control whether the group is expanded.
/// If not provided, it will default to always-expanded and non-interactive.
///
/// - Example (interactive):
/// ```swift
/// @State private var showAdvanced = false
///
/// SettingsDisclosureGroup(title: "Advanced", isExpanded: $showAdvanced) {
///     SettingsToggleRow(title: "Enable Dev Mode", isOn: $devMode)
/// }
/// ```
public struct SettingsDisclosureGroup<Content: View>: View {
    private let title: String
    @Binding private var isExpanded: Bool
    private let content: Content
    
    /// Creates a settings disclosure group.
    ///
    /// - Parameters:
    ///   - title: The section header displayed at the top of the group.
    ///   - isExpanded: A `Binding<Bool>` that controls whether the group is expanded. If omitted, defaults to `.constant(true)`.
    ///   - content: A view builder that provides the content inside the disclosure group.
    
    public init(
        title: String,
        isExpanded: Binding<Bool> = .constant(true),
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self._isExpanded = isExpanded
        self.content = content()
    }
    
    public var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            content
        } label: {
            Text(title)
        }
    }
}

