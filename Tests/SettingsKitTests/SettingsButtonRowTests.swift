//
//  SettingsButtonRowTests.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

/// Tests for `SettingsButtonRow`, verifying label and action execution.
///
/// These tests validate:
/// - Title rendering
/// - Action callback firing
/// - Optional `role` injection

import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsButtonRow` component.
import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsButtonRow`.
final class SettingsButtonRowTests: XCTestCase {
    
    /// Ensures the button triggers the passed action.
    func testButtonActionFires() {
        var didTap = false
        let button = SettingsButtonRow(title: "Reset All") {
            didTap = true
        }
        
        // Simulate the tap by calling the action manually (public in open source)
        button.action()
        XCTAssertTrue(didTap, "Expected action to fire when button is tapped.")
    }
    
    /// Ensures the button holds the correct title and role.
    func testButtonInitializesWithTitleAndRole() {
        let button = SettingsButtonRow(title: "Delete Account", role: .destructive) {
            // no-op
        }
        
        XCTAssertEqual(button.title, "Delete Account")
        XCTAssertEqual(button.role, .destructive)
    }
}
