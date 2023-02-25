//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-18.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
