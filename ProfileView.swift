//
//  ProfileView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/8/24.
//
import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @Binding var isSignUp: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var zip: String = ""
    @State private var phoneNumber: String = ""
    @State private var errorMessage: String = ""

    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 100)

                Text("Sign Up")
                    .font(Font.custom("Inter", size: 64).weight(.heavy))
                    .lineSpacing(22)
                    .foregroundColor(.black)
                    .offset(y: -50)

                Spacer().frame(height: 30)

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

                Spacer().frame(height: 40)

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

                Spacer().frame(height: 40)

                // ZIP Input Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("ZIP Code")
                        .font(Font.custom("Inter", size: 24))
                        .foregroundColor(.black)
                        .opacity(0.50)
                    TextField("ZIP", text: $zip)
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

                Spacer().frame(height: 40)

                // Phone Number Input Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Phone Number")
                        .font(Font.custom("Inter", size: 24))
                        .foregroundColor(.black)
                        .opacity(0.50)
                    TextField("Phone Number", text: $phoneNumber)
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

                Spacer().frame(height: 40)

                // Sign Up Button
                Button(action: {
                    signUp()
                }) {
                    Text("Sign Up")
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

                Spacer().frame(height: 20)

                // Error message
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Spacer()

                // Back to Log In Text
                Text("Back to Log In")
                    .font(Font.custom("Inter", size: 15).weight(.light))
                    .foregroundColor(Color(red: 0.98, green: 0.20, blue: 0.31))
                    .onTapGesture {
                        isSignUp.toggle()
                    }

                Spacer().frame(height: 20)

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

    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                // Navigate to login view
                isSignUp = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isSignUp: .constant(true))
    }
}
