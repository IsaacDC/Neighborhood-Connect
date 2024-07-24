//
//  ContentView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 6/22/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUp: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String = ""
    @State private var selectedTab: Tab = .magnifyingglass
    

    var body: some View {
        NavigationView {
            if isLoggedIn {
                HomeView(selectedTab: $selectedTab)
            } else if isSignUp {
                ProfileView(isSignUp: $isSignUp)
            } else {
                loginView
            }
        }
    }

    var loginView: some View {
        ZStack {
            VStack {
                Spacer().frame(height:20)
                Image("Designer (1)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200,height: 200)
                Spacer().frame(height: 80)

                // Email Input Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(Font.custom("Inter", size: 24))
                        .foregroundColor(.black)
                        .opacity(0.50)
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.25), lineWidth: 0.5)
                        )
                }
                .padding(.horizontal, 15)
                .frame(width: 360, height: 60)
                .offset(y: -40)

                Spacer().frame(height: 30)

                // Password Input Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(Font.custom("Inter", size: 24))
                        .foregroundColor(.black)
                        .opacity(0.50)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.25), lineWidth: 0.5)
                        )
                }
                .padding(.horizontal, 15)
                .frame(width: 360, height: 60)
                .offset(y: -40)

                Spacer().frame(height: 20)

                // Log In Button
                Button(action: {
                    login()
                }) {
                    Text("Log In")
                        .font(Font.custom("Inter", size: 24).weight(.medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.45, green: 0.82, blue: 0.40))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.25), lineWidth: 0.5)
                        )
                }
                .padding(.horizontal, 15)
                .frame(width: 360, height: 60)
                .offset(y: -40)

                Spacer().frame(height: 20)

                // Forgot Password Text
                Text("Forgot Password?")
                    .font(Font.custom("Inter", size: 15).weight(.light))
                    .foregroundColor(Color(red: 0.98, green: 0.20, blue: 0.31))
                    .offset(y: -40)

                Spacer().frame(height: 40)

                // Sign Up Text
                HStack {
                    Text("Don’t have an account?")
                        .font(Font.custom("Manrope", size: 14).weight(.semibold))
                        .foregroundColor(Color(red: 0.60, green: 0.62, blue: 0.63))
                    Text("Sign Up")
                        .font(Font.custom("Manrope", size: 14).weight(.semibold))
                        .foregroundColor(Color(red: 0.45, green: 0.82, blue: 0.40))
                        .onTapGesture {
                            isSignUp.toggle()
                        }
                }
                .offset(y: -40)

                Spacer()

                // Error message
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                // Bottom Rectangle
                Rectangle()
                    .frame(width: 134, height: 5)
                    .background(Color.black)
                    .cornerRadius(100)
                    .padding(.bottom, 8)

            }
            .frame(width: 390, height: 844)
            .background(Color.white)
        }
    }

    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
