//
//  RoverApp.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/19/24.
//

import SwiftUI

@main
struct RoverApp: App {
    @StateObject private var roverStateModel = RoverStateModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(roverStateModel)
        }
    }
}
