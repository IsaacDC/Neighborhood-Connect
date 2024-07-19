//
//  UserEventsView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct UserEventsView: View {
    @State private var signedUpEvents: [Event] = []
    @State private var errorMessage: String = ""

    var body: some View {
        NavigationView {
            List(signedUpEvents) { event in
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.headline)
                    Text("Type: \(event.type)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Address: \(event.address)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Attendees: \(event.attendees.count)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        unsubscribeFromEvent(event)
                    }) {
                        Text("Unsubscribe")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: EventDetailsView(event: event)) {
                        Text("Details")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .onAppear(perform: fetchSignedUpEvents)
            .navigationTitle("My Events")
        }
    }

    private func fetchSignedUpEvents() {
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            errorMessage = "Unable to get current user email."
            return
        }

        let ref = Database.database().reference().child("events")
        ref.observe(.value) { snapshot in
            var newEvents: [Event] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let event = Event(snapshot: snapshot) {
                    if event.attendees.contains(currentUserEmail) {
                        newEvents.append(event)
                    }
                }
            }
            self.signedUpEvents = newEvents
        }
    }

    private func unsubscribeFromEvent(_ event: Event) {
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            errorMessage = "Unable to get current user email."
            return
        }

        let ref = Database.database().reference().child("events").child(event.id).child("attendees")
        ref.observeSingleEvent(of: .value) { snapshot in
            var attendees = event.attendees
            if let index = attendees.firstIndex(of: currentUserEmail) {
                attendees.remove(at: index)
                ref.setValue(attendees) { error, _ in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    } else {
                        errorMessage = "Successfully unsubscribed from the event!"
                        fetchSignedUpEvents()
                    }
                }
            } else {
                errorMessage = "You are not signed up for this event."
            }
        }
    }
}

struct UserEventsView_Previews: PreviewProvider {
    static var previews: some View {
        UserEventsView()
    }
}
