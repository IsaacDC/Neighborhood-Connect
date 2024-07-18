//
//  chatView.swift
//  Cap2IOSProject
//
//  Created by Alessandro Escobar on 7/13/24.
//

import SwiftUI
import FirebaseDatabase



struct chatView: View {
    var groupChat: GroupChat
    @State private var messages: [Message] = []
    @State private var messageText: String = ""

    var body: some View {
        VStack {
            List(messages) { message in
                Text(message.text)
            }

            HStack {
                TextField("Enter message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
        .onAppear(perform: fetchMessages)
        .navigationTitle(groupChat.groupName)
    }

    private func fetchMessages() {
        let ref = Database.database().reference().child("groupChats/\(groupChat.id)/messages")
        ref.observe(.value) { snapshot in
            var newMessages: [Message] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let message = Message(snapshot: snapshot) {
                    newMessages.append(message)
                }
            }
            self.messages = newMessages
        }
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let ref = Database.database().reference().child("groupChats/\(groupChat.id)/messages").childByAutoId()
        let message = Message(id: ref.key ?? UUID().uuidString, text: messageText)
        ref.setValue(message.toAnyObject())
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        chatView(groupChat: GroupChat(id: "1", groupName: "Test Group", ageRange: "18-25", zipCode: "12345", users: ["testUser"], creatorEmail: "test@example.com"))
    }
}

struct Message: Identifiable {
    var id: String
    var text: String

    init(id: String, text: String) {
        self.id = id
        self.text = text
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any],
              let text = value["text"] as? String else {
            return nil
        }

        self.id = snapshot.key
        self.text = text
    }

    func toAnyObject() -> Any {
        return [
            "text": text
        ]
    }
}
