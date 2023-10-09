//
//  TourApp.swift
//  Tour
//
//  Created by Jai  on 09/10/23.
//

import SwiftUI
import SwiftData

@main
struct TourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Destination.self)
    }
}
