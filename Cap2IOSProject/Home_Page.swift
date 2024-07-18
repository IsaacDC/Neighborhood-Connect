//
//  Home_Page.swift
//  Cap2IOSProject
//
//  Created by Alessandro Escobar on 7/11/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct Home: View {
  var body: some View {
    ZStack() {
      Button(action: {
        // Handle find events action here
        print("Find Events button tapped")
      }) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 300, height: 40)
            .background(Color(red: 0.23, green: 0.22, blue: 0.22))
            .cornerRadius(6)
          Text("Find Events")
            .font(Font.custom("Inter", size: 20).weight(.medium))
            .lineSpacing(17.50)
            .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
        }
      }
      .frame(width: 300, height: 40)
      .offset(x: 0, y: 352)
      
      ZStack() {
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 45, height: 45)
          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
      }
      .frame(width: 45, height: 45)
      .offset(x: 159.50, y: -382.50)
      
      Text("LOGO")
        .font(Font.custom("Inter", size: 64).weight(.heavy))
        .lineSpacing(22)
        .foregroundColor(.black)
        .offset(x: 0, y: -291)
      
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 360, height: 520)
        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
        .offset(x: 0, y: 49)
      
      Text("Your Registered Events:")
        .font(Font.custom("Inter", size: 16).weight(.bold))
        .lineSpacing(22)
        .foregroundColor(.black)
        .offset(x: -59.50, y: -226.50)
    }
    .frame(width: 390, height: 844)
    .background(Color(red: 0.67, green: 0.18, blue: 0.98))
  }
}
