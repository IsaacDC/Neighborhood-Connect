import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 0) {
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
      ZStack() {
        Text("Events")
          .font(Font.custom("Inter", size: 32).weight(.medium))
          .lineSpacing(28.01)
          .foregroundColor(.black)
          .offset(x: 0, y: -73.85)
        HStack(spacing: 110) {
          VStack(alignment: .leading, spacing: 10) {
            Text("Event Name")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.black)
            Text("Group name")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.white)
          }
          HStack(spacing: 0) {
            Text("Details")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
          .background(.black)
          .cornerRadius(10)
        }
        .padding(10)
        .frame(width: 340, height: 64.84)
        .background(Color(red: 0.45, green: 0.82, blue: 0.40))
        .cornerRadius(10)
        .offset(x: 0, y: 1.69)
        HStack(spacing: 110) {
          VStack(alignment: .leading, spacing: 10) {
            Text("Event Name")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.black)
            Text("Group name")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.white)
          }
          HStack(spacing: 0) {
            Text("Details")
              .font(Font.custom("Inter", size: 20))
              .lineSpacing(17.50)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
          .background(.black)
          .cornerRadius(10)
        }
        .padding(10)
        .frame(width: 340, height: 64.84)
        .background(Color(red: 0.45, green: 0.82, blue: 0.40))
        .cornerRadius(10)
        .offset(x: 0, y: 66.40)
      }
      .frame(width: 340, height: 197.64)
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 586.36, trailing: 0))
    .frame(width: 390, height: 844)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}