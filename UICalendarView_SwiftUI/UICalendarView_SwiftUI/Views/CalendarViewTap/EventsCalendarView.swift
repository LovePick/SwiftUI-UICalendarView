//
//  EventsCalendarView.swift
//  UICalendarView_SwiftUI
//
//  Created by Supapon Pucknavin on 8/11/2565 BE.
//

import SwiftUI

struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             eventStore: eventStore,
                             dateSelected: $dateSelected,
                             displayEvent: $displayEvents
                )
                
            }//: SCROLL
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
            .sheet(item: $formType) { $0 } //: SHEET ADD NEW
            .sheet(isPresented: $displayEvents, content: {
                DateEventsListView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            })//: SHEET DETAIL
            .navigationTitle("Calendar View")
        }
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
            .environmentObject(EventStore(preview: true))
    }
}
