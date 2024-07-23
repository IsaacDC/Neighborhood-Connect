import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack() {
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 411, height: 823)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .offset(x: 0, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 411, height: 294)
                    .background(Color(red: 0.45, green: 0.82, blue: 0.40))
                    .cornerRadius(12)
                    .offset(x: 0, y: -264.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 379, height: 635)
                    .background(.white)
                    .cornerRadius(16)
                    .offset(x: 0, y: 34)
                    .shadow(
                        color: Color(red: 0.30, green: 0.30, blue: 0.30, opacity: 0.15), radius: 16, y: 2
                    )
                TextField("Enter your email", text: $email)
                    .padding()
                    .frame(width: 334, height: 44)
                    .background(Color(red: 0.60, green: 0.62, blue: 0.63))
                    .cornerRadius(6)
                    .offset(x: 2.50, y: 27.50)
                TextField("Enter your password", text: $password)
                    .padding()
                    .frame(width: 334, height: 44)
                    .background(Color(red: 0.60, green: 0.62, blue: 0.63))
                    .cornerRadius(6)
                    .offset(x: 2.50, y: -64.50)
                Button(action: {
                    // Save changes action
                }) {
                    Text("Save changes")
                        .font(Font.custom("Inter", size: 20).weight(.medium))
                        .lineSpacing(17.50)
                        .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                        .background(Color(red: 0.45, green: 0.82, blue: 0.40))
                        .cornerRadius(10)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        )
                }
                .offset(x: -14.50, y: 119.50)
                ZStack() {
                    Text("More")
                        .font(Font.custom("Rubik", size: 18))
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .offset(x: -143.50, y: -56)
                    ZStack() {
                        Text("Logout")
                            .font(Font.custom("Rubik", size: 18))
                            .foregroundColor(.black)
                            .offset(x: -134.50, y: -0.50)
                        ZStack() { }
                            .frame(width: 24, height: 24)
                            .offset(x: 152.50, y: 0)
                    }
                    .frame(width: 329, height: 24)
                    .offset(x: 0, y: -1.50)
                    ZStack() {
                        Text("Delete Account")
                            .font(Font.custom("Rubik", size: 18))
                            .foregroundColor(Color(red: 1, green: 0, blue: 0.14))
                            .offset(x: -100, y: -1.50)
                        ZStack() { }
                            .frame(width: 24, height: 24)
                            .offset(x: 152.50, y: 0)
                    }
                    .frame(width: 329, height: 24)
                    .offset(x: 0, y: 54.50)
                }
                .frame(height: 133)
                .offset(x: 0, y: 253)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 379, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.79, green: 0.79, blue: 0.79), lineWidth: 0.25)
                    )
                    .offset(x: 0, y: 162.50)
                Text("User ID")
                    .font(Font.custom("Rubik", size: 32))
                    .foregroundColor(.black)
                    .offset(x: -105, y: -255.50)
            }
            Group {
                ZStack() {
                    ZStack() { }
                        .frame(width: 40, height: 40)
                        .offset(x: -65, y: 0)
                    Text("Settings")
                        .font(Font.custom("Rubik", size: 28).weight(.medium))
                        .tracking(0.98)
                        .foregroundColor(.white)
                        .offset(x: 24, y: 0.50)
                }
                .frame(width: 170)
                .offset(x: -104.50, y: -335.50)
                Text("Account Settings")
                    .font(Font.custom("Rubik", size: 18))
                    .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                    .offset(x: -91.50, y: -161)
                Text("Change Email")
                    .font(Font.custom("Rubik", size: 18))
                    .foregroundColor(.black)
                    .offset(x: -107, y: -108)
                Text("Change password")
                    .font(Font.custom("Rubik", size: 18))
                    .foregroundColor(.black)
                    .offset(x: -89.50, y: -16)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 379, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.79, green: 0.79, blue: 0.79), lineWidth: 0.25)
                    )
                    .offset(x: 0, y: -195.50)
                Text("Email")
                    .font(Font.custom("Rubik", size: 16))
                    .foregroundColor(Color(red: 0.60, green: 0.62, blue: 0.63))
                    .offset(x: -139, y: -217)
            }
        }
        .frame(width: 411, height: 823)
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
