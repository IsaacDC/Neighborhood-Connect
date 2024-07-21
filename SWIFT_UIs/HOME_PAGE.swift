import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 58) {
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 390, height: 60)
          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
          .offset(x: 0, y: 0)
        ZStack() {
          Ellipse()
            .foregroundColor(.clear)
            .frame(width: 40, height: 40)
            .background(.white)
            .offset(x: 0, y: 0)
        }
        .frame(width: 40, height: 40)
        .offset(x: 157, y: 0)
        Text("Logo")
          .font(Font.custom("Manrope", size: 20).weight(.semibold))
          .lineSpacing(20)
          .foregroundColor(.black)
          .offset(x: -131.50, y: -3)
      }
      .frame(width: 390, height: 60)
      VStack(spacing: 7) {
        Text("No Registered Events")
          .font(Font.custom("Manrope", size: 24).weight(.bold))
          .lineSpacing(24)
          .foregroundColor(.black)
        Text("Click here to register")
          .font(Font.custom("Manrope", size: 20).weight(.semibold))
          .lineSpacing(20)
          .foregroundColor(.black)
      }
      .padding(EdgeInsets(top: 147, leading: 42, bottom: 147, trailing: 42))
      .frame(maxWidth: .infinity, minHeight: 570, maxHeight: 570)
      .background(Color(red: 0.45, green: 0.82, blue: 0.40))
      .cornerRadius(10)
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 156, trailing: 0))
    .frame(width: 390, height: 844)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}