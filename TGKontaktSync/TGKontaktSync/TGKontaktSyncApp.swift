//
//  TGKontaktSyncApp.swift
//  TGKontaktSync
//
//  Created by edv on 22.06.23.
//

import SwiftUI

@main
struct TGKontaktSyncApp: App {
    @StateObject var select = Switch()
    var body: some Scene {
        WindowGroup {
            MainView()
                 .environmentObject(select)
        }
    }
}
