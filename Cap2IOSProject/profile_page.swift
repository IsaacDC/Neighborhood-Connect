//
//  profile_page.swift
//  Cap2IOSProject
//
//  Created by Alessandro Escobar on 7/11/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct Profile: View {
  var body: some View {
    ZStack() {
      Text("Edit Profile")
        .font(Font.custom("Inter", size: 20).weight(.bold))
        .lineSpacing(17.50)
        .foregroundColor(.black)
        .offset(x: 0.50, y: -346)
      
      ZStack() {
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 171.47, height: 175.97)
          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
          .overlay(
            Ellipse()
              .inset(by: 0.50)
              .stroke(Color(red: 0.14, green: 0.15, blue: 0.38), lineWidth: 0.50)
          )
          .offset(x: 0, y: 0)
        HStack(spacing: 0) {

        }
        .padding(EdgeInsets(top: 4, leading: 2.67, bottom: 4, trailing: 2.67))
        .frame(width: 32, height: 32)
        .offset(x: 58.26, y: 69.01)
      }
      .frame(width: 171.47, height: 175.97)
      .offset(x: -0.26, y: -226.01)
      
      ZStack() {
        Text("First Name")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(.black)
          .offset(x: -128.50, y: -27.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 342, height: 44)
          .background(.white)
          .cornerRadius(6)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: -79.50)
      
      ZStack() {
        Text("Last Name")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(.black)
          .offset(x: -128.50, y: -27.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 342, height: 44)
          .background(.white)
          .cornerRadius(6)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: 7.50)
      
      ZStack() {
        Text("Email")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(.black)
          .offset(x: -149.50, y: -27.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 342, height: 44)
          .background(.white)
          .cornerRadius(6)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: 94.50)
      
      ZStack() {
        Text("Password")
          .font(Font.custom("Inter", size: 16).weight(.bold))
          .lineSpacing(14)
          .foregroundColor(.black)
          .offset(x: -132.50, y: -27.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 342, height: 44)
          .background(.white)
          .cornerRadius(6)
          .offset(x: 0, y: 12.50)
      }
      .frame(height: 69)
      .offset(x: 0, y: 181.50)
      
      Button(action: {
        // Handle save changes action here
        print("Save changes button tapped")
      }) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 221, height: 45)
            .background(Color(red: 0.23, green: 0.22, blue: 0.22))
            .cornerRadius(6)
            .offset(x: 0, y: 0)
          Text("Save changes")
            .font(Font.custom("Inter", size: 20).weight(.medium))
            .lineSpacing(17.50)
            .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
            .offset(x: 0.50, y: 0.50)
        }
      }
      .frame(width: 221, height: 45)
      .offset(x: 5.50, y: 354.50)
    }
    .frame(width: 390, height: 844)
    .background(Color(red: 0.67, green: 0.18, blue: 0.98))
  }
}
