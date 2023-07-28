//
//  MegatenFusionToolApp.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

import SwiftUI







@main
struct MegatenFusionToolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
