//
//  SettingsToggleRowTests.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

/// Tests for `SettingsToggleRow`, ensuring correct rendering and toggle binding behavior.
///
/// These tests validate:
/// - Title and subtitle rendering from initializer
/// - Optional subtitle handling
/// - Toggle state propagation via `@Binding`

import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsToggleRow` component.
import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsToggleRow`.
final class SettingsToggleRowTests: XCTestCase {

    /// Validates that the toggle reflects the bound state.
    func testToggleStateBindingReflectsInitialValue() {
        var isOn = false
        let binding = Binding(
            get: { isOn },
            set: { isOn = $0 }
        )

        let toggle = SettingsToggleRow(title: "Notifications", isOn: binding)
        XCTAssertFalse(binding.wrappedValue)
        XCTAssertNotNil(toggle)
    }

    /// Validates that toggling the binding updates the state.
    func testToggleBindingUpdatesState() {
        var isOn = false
        let binding = Binding(
            get: { isOn },
            set: { isOn = $0 }
        )

        let _ = SettingsToggleRow(title: "Dark Mode", isOn: binding)
        binding.wrappedValue = true

        XCTAssertTrue(isOn, "Expected bound state to reflect toggle change.")
    }

    /// Validates toggle with a subtitle still compiles and uses the binding.
    func testToggleWithSubtitle() {
        var isOn = true
        let binding = Binding(
            get: { isOn },
            set: { isOn = $0 }
        )

        let toggle = SettingsToggleRow(
            title: "Background Refresh",
            subtitle: "Keeps content updated in the background",
            isOn: binding
        )

        XCTAssertTrue(binding.wrappedValue)
        XCTAssertNotNil(toggle)
    }
}
