//
//  SignUpForEventView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct SignUpForEventView: View {
    @State private var availableEvents: [Event] = []
    @State private var errorMessage: String = ""

    var body: some View {
        NavigationView {
            List(availableEvents) { event in
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
                        signUpForEvent(event)
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
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
            .onAppear(perform: fetchEvents)
            .navigationTitle("Sign Up for Events")
        }
    }

    private func fetchEvents() {
        let ref = Database.database().reference().child("events")
        ref.observe(.value) { snapshot in
            var newEvents: [Event] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let event = Event(snapshot: snapshot) {
                    newEvents.append(event)
                }
            }
            self.availableEvents = newEvents
        }
    }

    private func signUpForEvent(_ event: Event) {
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            errorMessage = "Unable to get current user email."
            return
        }

        let ref = Database.database().reference().child("events").child(event.id).child("attendees")
        ref.observeSingleEvent(of: .value) { snapshot in
            var attendees = event.attendees
            if !attendees.contains(currentUserEmail) {
                attendees.append(currentUserEmail)
                ref.setValue(attendees) { error, _ in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    } else {
                        errorMessage = "Successfully signed up for the event!"
                        fetchEvents()
                    }
                }
            } else {
                errorMessage = "You are already signed up for this event."
            }
        }
    }
}

struct SignUpForEventView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpForEventView()
    }
}
