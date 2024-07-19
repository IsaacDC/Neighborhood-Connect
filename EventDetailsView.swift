//
//  EventDetailsView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI

struct EventDetailsView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(event.name)
                .font(.largeTitle)
                .bold()

            Text("Type: \(event.type)")
                .font(.title2)

            Text("Description: \(event.description)")
                .font(.title2)

            Text("Address: \(event.address)")
                .font(.title2)

            Text("Date: \(event.date, formatter: eventDateFormatter)")
                .font(.title2)

            Text("Attendees: \(event.attendees.count)")
                .font(.title2)

            List(event.attendees, id: \.self) { attendee in
                Text(attendee)
            }
        }
        .padding()
        .navigationTitle("Event Details")
    }
}

private let eventDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleEvent = Event(
            id: "1",
            name: "Sample Event",
            type: "Party",
            description: "This is a sample event description.",
            address: "123 Main St",
            date: Date(),
            attendees: ["user1@example.com", "user2@example.com"]
        )
        EventDetailsView(event: sampleEvent)
    }
}
