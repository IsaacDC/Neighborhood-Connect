struct LoginScreen: View {
  @State private var email: String = ""
  @State private var password: String = ""
  
  var body: some View {
    ZStack() {
      ZStack() {
        Text("Don’t have an account ? ")
          .font(Font.custom("Manrope", size: 14).weight(.semibold))
          .foregroundColor(Color(red: 0.60, green: 0.62, blue: 0.63))
          .offset(x: -30.50, y: 0)
        Text("Sign Up")
          .font(Font.custom("Manrope", size: 14).weight(.semibold))
          .foregroundColor(Color(red: 0.92, green: 1, blue: 0))
          .offset(x: 84, y: 0)
      }
      .offset(x: 0, y: 378.50)
      Text("Forgot Password?")
        .font(Font.custom("Inter", size: 15).weight(.light))
        .lineSpacing(22)
        .foregroundColor(Color(red: 0.98, green: 0.20, blue: 0.31))
        .offset(x: 111, y: -61)
      Text("LOGO")
        .font(Font.custom("Inter", size: 64).weight(.heavy))
        .lineSpacing(22)
        .foregroundColor(.black)
        .offset(x: 0, y: -291)
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
      .offset(x: 0, y: -192.50)
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
      .offset(x: 0, y: -113.50)
      Button(action: {
        // Handle login action here
        print("Login button tapped")
      }) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 221, height: 45)
            .background(Color(red: 0.23, green: 0.22, blue: 0.22))
            .cornerRadius(6)
          Text("Login")
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
