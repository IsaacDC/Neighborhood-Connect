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
            Group {
                NavigationLink(destination: chatView(groupChat: groupChat)) {
                    HStack {
                        Image(systemName: "message.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Chat")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)

                NavigationLink(destination: CreateEventView()) {
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Create Event")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)

                NavigationLink(destination: SignUpForEventView()) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Sign Up for Event")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)

                NavigationLink(destination: UserEventsView()) {
                    HStack {
                        Image(systemName: "eye.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("View Events")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.systemGray6))
                    .shadow(radius: 5)
            )
            .padding(.vertical, 20)

            Spacer()
        }
        .navigationTitle(groupChat.groupName)
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct GroupChatOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatOptionsView(groupChat: GroupChat(id: "1", groupName: "Test Group", ageRange: "18-25", zipCode: "12345", users: ["testUser"], creatorEmail: "test@example.com"))
    }
}
