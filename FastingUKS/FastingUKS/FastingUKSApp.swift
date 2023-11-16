//
//  FastingUKSApp.swift
//  FastingUKS
//
//  Created by UKS on 14.11.2023.
//

import SwiftUI

@main
struct FastingUKSApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
