//
//  CreateEventView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct CreateEventView: View {
    @State private var eventName: String = ""
    @State private var selectedEventType: String = "Gathering"
    @State private var eventDescription: String = ""
    @State private var eventAddress: String = ""
    @State private var eventDate: Date = Date()
    @State private var errorMessage: String = ""

    let eventTypes = ["Gathering", "Sporting", "Party", "Workshop", "Concert"]

    var body: some View {
        VStack {
            TextField("Event Name", text: $eventName)
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            
            Picker("Event Type", selection: $selectedEventType) {
                ForEach(eventTypes, id: \.self) {
                    Text($0)
                }
            }
            .padding()
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            .cornerRadius(10)
            .padding(.horizontal, 15)
            
            TextField("Event Description", text: $eventDescription)
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            
            TextField("Event Address", text: $eventAddress)
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            
            DatePicker("Event Date and Time", selection: $eventDate, displayedComponents: [.date, .hourAndMinute])
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            
            Button(action: {
                createEvent()
            }) {
                Text("Create Event")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Create Event")
    }

    private func createEvent() {
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            errorMessage = "Unable to get current user email."
            return
        }

        let ref = Database.database().reference().child("events").childByAutoId()
        let event = Event(id: ref.key ?? UUID().uuidString, name: eventName, type: selectedEventType, description: eventDescription, address: eventAddress, date: eventDate, attendees: [currentUserEmail])
        ref.setValue(event.toAnyObject()) { error, _ in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = "Event created successfully!"
            }
        }
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
