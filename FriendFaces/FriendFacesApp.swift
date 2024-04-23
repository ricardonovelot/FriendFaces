//
//  FriendFacesApp.swift
//  FriendFaces
//
//  Created by Ricardo on 18/04/24.
//

import SwiftUI
import SwiftData

@main
struct FriendFacesApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([User.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
