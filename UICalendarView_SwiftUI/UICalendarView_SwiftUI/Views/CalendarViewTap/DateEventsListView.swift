//
//  DateEventsListView.swift
//  UICalendarView_SwiftUI
//
//  Created by Supapon Pucknavin on 8/11/2565 BE.
//

import SwiftUI

struct DateEventsListView: View {
    @EnvironmentObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationView {
            Group {
                if let dateSelected {
                    let foundEvents = eventStore.events
                        .filter {$0.date.startOfDay == dateSelected.date!.startOfDay}
                    List {
                        ForEach(foundEvents) { event in
                            ListViewRow(event: event, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        eventStore.delete(event)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .sheet(item: $formType) { $0 }
                        }//: LOOP
                    }//: LIST
                }//: CONDITION
            }//: GROUP
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
        }//: NAVIGATION
    }
}

struct DateEventsListView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    static var previews: some View {
        DateEventsListView(dateSelected: .constant(dateComponents))
            .environmentObject(EventStore(preview: true)
            )
    }
}
