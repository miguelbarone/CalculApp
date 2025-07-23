//
//  AppDelegate.swift
//  CalculApp
//
//  Created by Miguel Barone on 16/04/25.
//

import CoreData
import SwiftUI

@main
struct CalculApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environment(persistenceController)
        }
    }
}
