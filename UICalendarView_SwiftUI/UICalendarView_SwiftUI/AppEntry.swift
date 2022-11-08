//
//  UICalendarView_SwiftUIApp.swift
//  UICalendarView_SwiftUI
//
//  Created by Supapon Pucknavin on 8/11/2565 BE.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var myEvents = EventStore(preview: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myEvents)
        }
    }
}
