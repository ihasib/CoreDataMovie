//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by S. M. Hasibur Rahman on 2/1/23.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
