//
//  GroupChatOptionView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI

struct GroupChatOptionsView: View {
    var groupChat: GroupChat

    var body: some View {
        VStack {
            NavigationLink(destination: chatView(groupChat: groupChat)) {
                Text("Chat")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)

            NavigationLink(destination: CreateEventView()) {
                Text("Create Event")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)

            NavigationLink(destination: SignUpForEventView()) {
                Text("Sign Up for Event")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)

            NavigationLink(destination: UserEventsView()) {
                Text("View Events")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)

            Spacer()
        }
        .navigationTitle(groupChat.groupName)
        .padding()
    }
}

struct GroupChatOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatOptionsView(groupChat: GroupChat(id: "1", groupName: "Test Group", ageRange: "18-25", zipCode: "12345", users: ["testUser"], creatorEmail: "test@example.com"))
    }
}
