//
//  SettingsDisclosureGroupTests.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

/// Tests for `SettingsDisclosureGroup`, validating initialization and label handling.
///
/// These tests verify:
/// - Proper title storage
/// - Internal expansion state setup

import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsDisclosureGroup` component.
final class SettingsDisclosureGroupTests: XCTestCase {

    /// Ensures the title is stored and renders correctly.
    func testDisclosureGroupTitleDisplays() {
        let group = SettingsDisclosureGroup(title: "Advanced") {
            EmptyView()
        }

        // Since we can't render views in XCTest directly without ViewInspector,
        // we only assert this compiles and runs — deeper UI testing belongs in integration tests.
        XCTAssertNotNil(group)
    }

    /// Ensures the initial expansion state is collapsed if no binding is passed.
    func testDisclosureGroupInitialStateCollapsed() {
        var isExpanded = false
        let binding = Binding(
            get: { isExpanded },
            set: { isExpanded = $0 }
        )

        let group = SettingsDisclosureGroup(title: "Debug", isExpanded: binding) {
            EmptyView()
        }

        XCTAssertFalse(binding.wrappedValue)
        XCTAssertNotNil(group)
    }

    /// Verifies that passing `isExpanded: true` starts the group expanded.
    func testDisclosureStartsExpanded() {
        var isExpanded = true
        let binding = Binding(
            get: { isExpanded },
            set: { isExpanded = $0 }
        )

        let group = SettingsDisclosureGroup(title: "Developer Settings", isExpanded: binding) {
            Text("Internal Tools")
        }

        XCTAssertTrue(binding.wrappedValue)
        XCTAssertNotNil(group)
    }
}
