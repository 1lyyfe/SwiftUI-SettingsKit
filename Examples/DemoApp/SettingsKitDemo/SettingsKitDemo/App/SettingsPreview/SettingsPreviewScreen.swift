//
//  SettingsPreviewScreen.swift
//  SettingsKitDemo
//
//  Created by Haider Ashfaq on 21/04/2025.
//

import SwiftUI
import SettingsKit

/// A complete demo screen showcasing all SettingsKit components.
struct SettingsPreviewScreen: View {
    @State private var notificationsEnabled = true
    @State private var backgroundSync = false
    @State private var devMode = false
    @State private var showDebugTools = false
    @State private var showAdvanced = false

    var body: some View {
        NavigationStack {
            Form {
                SettingsSection(header: "General") {
                    SettingsToggleRow(title: "Enable Notifications", isOn: $notificationsEnabled)
                    SettingsToggleRow(title: "Background Sync", subtitle: "Keeps data updated in background", isOn: $backgroundSync)

                    SettingsNavigationRow(title: "Appearance") {
                        Text("Appearance Settings")
                            .navigationTitle("Appearance")
                    }
                }

                SettingsSection(header: "Advanced") {
                    SettingsDisclosureGroup(title: "Developer Options", isExpanded: $showAdvanced) {
                        SettingsToggleRow(title: "Enable Developer Mode", isOn: $devMode)
                        SettingsToggleRow(title: "Show Debug Tools", isOn: $showDebugTools)
                    }
                }

                SettingsSection(header: "Account") {
                    SettingsButtonRow(title: "Log Out", role: .destructive) {
                        print("Logged out")
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .settingsStyle(.default)
    }
}

// MARK: - Preview
#Preview {
    SettingsPreviewScreen()
}

