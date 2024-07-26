//
//  settingsView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct settingsView: View {
    @State private var user: User? = Auth.auth().currentUser
    @State private var userID: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            
            if let user = user {
                VStack(alignment: .leading, spacing: 20) {
                    Text("User ID: \(userID.isEmpty ? "Loading..." : userID)")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Text("Email: \(user.email ?? "Unknown")")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding()
                .onAppear {
                    fetchUserID()
                }
            } else {
                Text("No user information available.")
                    .font(.title2)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            Button(action: {
                signOut()
            }) {
                Text("Sign Out")
                    .font(Font.custom("Inter", size: 24).weight(.medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.red))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.25), lineWidth: 0.5)
                    )
            }
            .padding(.horizontal, 15)
            .frame(width: 360, height: 60)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .navigationBarTitle("Profile Details", displayMode: .inline)
        .onAppear {
            user = Auth.auth().currentUser
        }
    }
    
    private func fetchUserID() {
        guard let user = user else { return }
        let ref = Database.database().reference()
        ref.child("users").child(user.uid).observeSingleEvent(of: .value) { snapshot in
            if let userData = snapshot.value as? [String: Any], let userID = userData["userID"] as? String {
                self.userID = userID
            } else {
                self.errorMessage = "Failed to load user ID"
            }
        } withCancel: { error in
            self.errorMessage = error.localizedDescription
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: ContentView())
                window.makeKeyAndVisible()
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
