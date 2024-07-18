//
//  Sign_Up.swift
//  Cap2IOSProject
//
//  Created by Alessandro Escobar on 7/11/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SignUp: View {
  @State private var firstName: String = ""
  @State private var lastName: String = ""
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var confirmPassword: String = ""

  var body: some View {
    ZStack() {
      ZStack() {
        Text("Already have an account ?")
          .font(Font.custom("Manrope", size: 14).weight(.semibold))
          .foregroundColor(Color(red: 0.60, green: 0.62, blue: 0.63))
          .offset(x: -20.50, y: 0)
        Text("Login")
          .font(Font.custom("Manrope", size: 14).weight(.semibold))
          .foregroundColor(Color(red: 0.92, green: 1, blue: 0))
          .offset(x: 89, y: 0)
      }
      .offset(x: -2.50, y: 378.50)
      
      ZStack() {
        Text("First Name")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
          .offset(x: -128.50, y: -27.50)
        TextField("", text: $firstName)
          .padding()
          .background(Color.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color(red: 0.33, green: 0.30, blue: 0.30).opacity(0.14), lineWidth: 0.50)
          )
          .frame(width: 342, height: 44)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: -192.50)
      
      ZStack() {
        Text("Last Name")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
          .offset(x: -129.50, y: -27.50)
        TextField("", text: $lastName)
          .padding()
          .background(Color.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color(red: 0.33, green: 0.30, blue: 0.30).opacity(0.14), lineWidth: 0.50)
          )
          .frame(width: 342, height: 44)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: -113.50)
      
      ZStack() {
        Text("Email")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
          .offset(x: -149.50, y: -27.50)
        TextField("", text: $email)
          .padding()
          .background(Color.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color(red: 0.33, green: 0.30, blue: 0.30).opacity(0.14), lineWidth: 0.50)
          )
          .frame(width: 342, height: 44)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: -34.50)
      
      ZStack() {
        Text("Password")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
          .offset(x: -132.50, y: -27.50)
        SecureField("", text: $password)
          .padding()
          .background(Color.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color(red: 0.33, green: 0.30, blue: 0.30).opacity(0.14), lineWidth: 0.50)
          )
          .frame(width: 342, height: 44)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: 44.50)
      
      ZStack() {
        Text("Confirm Password")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
          .offset(x: -98.50, y: -27.50)
        SecureField("", text: $confirmPassword)
          .padding()
          .background(Color.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color(red: 0.33, green: 0.30, blue: 0.30).opacity(0.14), lineWidth: 0.50)
          )
          .frame(width: 342, height: 44)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: 123.50)
      
      Text("LOGO")
        .font(Font.custom("Inter", size: 64).weight(.heavy))
        .lineSpacing(22)
        .foregroundColor(.black)
        .offset(x: 0, y: -291)
      
      Button(action: {
        // Handle sign up action here
        print("Sign Up button tapped")
      }) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 221, height: 45)
            .background(Color(red: 0.23, green: 0.22, blue: 0.22))
            .cornerRadius(6)
          Text("Sign Up")
            .font(Font.custom("Inter", size: 20).weight(.medium))
            .lineSpacing(17.50)
            .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
        }
      }
      .frame(width: 221, height: 45)
      .offset(x: 0.50, y: 263.50)
    }
    .frame(width: 390, height: 844)
    .background(Color(red: 0.67, green: 0.18, blue: 0.98))
  }
}
