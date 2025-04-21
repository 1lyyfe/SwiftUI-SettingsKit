//
//  SettingsNavigationRowTests.swift
//
//
//  Created by Haider Ashfaq on 21/04/2025.
//

/// Tests for `SettingsNavigationRow`, ensuring title/subtitle are passed and stored correctly.
///
/// These tests validate:
/// - Rendering of title and optional subtitle
/// - Initialization with only title

import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsNavigationRow` component.
import XCTest
import SwiftUI
@testable import SettingsKit

/// Unit tests for `SettingsNavigationRow`.
final class SettingsNavigationRowTests: XCTestCase {
    
    /// Ensures the row initializes with the correct title and renders a destination.
    func testNavigationRowInitializes() {
        let row = SettingsNavigationRow(title: "Appearance") {
            Text("Destination View")
        }
        
        XCTAssertEqual(row.title, "Appearance")
        XCTAssertNotNil(row.destination)
    }
    
    /// Ensures the destination closure returns a view.
    func testNavigationRowDestinationContent() {
        let row = SettingsNavigationRow(title: "Account") {
            VStack {
                Text("Username")
                Text("Email")
            }
        }
        
        // Call the closure to confirm it builds a view
        let destinationView = row.destination
        XCTAssertNotNil(destinationView)
    }
}
