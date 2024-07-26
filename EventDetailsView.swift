//
//  EventDetailsView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import MapKit

struct EventDetailsView: View {
    var event: Event
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default coordinates, replace with actual event coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ScrollView {
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
                .frame(height: 150) // Set a fixed height for the list

                // Map view showing the event address
                Map(coordinateRegion: $region, interactionModes: [])
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Event Details")
        .onAppear {
            geocodeAddress(event.address)
        }
    }

    // Function to geocode the address to coordinates
    private func geocodeAddress(_ address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                region.center = location.coordinate
            }
        }
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
            address: "123 Main St, San Francisco, CA",
            date: Date(),
            attendees: ["user1@example.com", "user2@example.com"]
        )
        EventDetailsView(event: sampleEvent)
    }
}
