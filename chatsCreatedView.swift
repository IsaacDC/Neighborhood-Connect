//
//  chatsCreatedView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct chatsCreatedView: View {
    @State private var createdGroupChats: [GroupChat] = []
    @State private var joinedGroupChats: [GroupChat] = []

    var body: some View {
        List {
            Section(header: Text("Created Neighborhood Groups")) {
                ForEach(createdGroupChats) { groupChat in
                    NavigationLink(destination: GroupChatOptionsView(groupChat: groupChat)) {
                        VStack(alignment: .leading) {
                            Text(groupChat.groupName)
                                .font(.headline)
                            Text("ZIP Code: \(groupChat.zipCode)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }

            Section(header: Text("Joined Neighborhood Groups")) {
                ForEach(joinedGroupChats) { groupChat in
                    NavigationLink(destination: GroupChatOptionsView(groupChat: groupChat)) {
                        VStack(alignment: .leading) {
                            Text(groupChat.groupName)
                                .font(.headline)
                            Text("ZIP Code: \(groupChat.zipCode)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .onAppear(perform: fetchGroupChats)
        .navigationTitle("Neighborhood Groups")
    }

    private func fetchGroupChats() {
        guard let currentUserEmail = Auth.auth().currentUser?.email else {
            print("Unable to get current user email.")
            return
        }

        let ref = Database.database().reference().child("groupChats")
        ref.observe(.value) { snapshot in
            var newCreatedGroupChats: [GroupChat] = []
            var newJoinedGroupChats: [GroupChat] = []

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let groupChat = GroupChat(snapshot: snapshot) {
                    if groupChat.users.contains(currentUserEmail) {
                        if groupChat.creatorEmail == currentUserEmail {
                            newCreatedGroupChats.append(groupChat)
                        } else {
                            newJoinedGroupChats.append(groupChat)
                        }
                    }
                }
            }

            self.createdGroupChats = newCreatedGroupChats
            self.joinedGroupChats = newJoinedGroupChats
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        chatsCreatedView()
    }
}


struct GroupChat: Identifiable {
    var id: String
    var groupName: String
    var ageRange: String
    var zipCode: String
    var users: [String]
    var creatorEmail: String

    init(id: String, groupName: String, ageRange: String, zipCode: String, users: [String], creatorEmail: String) {
        self.id = id
        self.groupName = groupName
        self.ageRange = ageRange
        self.zipCode = zipCode
        self.users = users
        self.creatorEmail = creatorEmail
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any],
              let groupName = value["groupName"] as? String,
              let ageRange = value["ageRange"] as? String,
              let zipCode = value["zipCode"] as? String,
              let users = value["users"] as? [String],
              let creatorEmail = value["creatorEmail"] as? String else {
            return nil
        }

        self.id = snapshot.key
        self.groupName = groupName
        self.ageRange = ageRange
        self.zipCode = zipCode
        self.users = users
        self.creatorEmail = creatorEmail
    }

    func toAnyObject() -> Any {
        return [
            "groupName": groupName,
            "ageRange": ageRange,
            "zipCode": zipCode,
            "users": users,
            "creatorEmail": creatorEmail
        ]
    }
}
