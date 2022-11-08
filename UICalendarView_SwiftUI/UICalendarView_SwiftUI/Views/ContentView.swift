//
//  ContentView.swift
//  UICalendarView_SwiftUI
//
//  Created by Supapon Pucknavin on 8/11/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var myEvents: EventStore
    
    var body: some View {
        TabView{
            EventsListView()
                .tabItem {
                    Label("List", systemImage: "list.triangle")
                }
            EventsCalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EventStore(preview: true))
    }
}
