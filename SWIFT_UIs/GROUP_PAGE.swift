import SwiftUI

struct Group: View {
    @State private var groupName: String = ""
    @State private var zipCode: String = ""
    @State private var age: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 75) {
                Text("Join Group")
                    .font(Font.custom("Inter", size: 36).weight(.bold))
                    .lineSpacing(31.51)
                    .foregroundColor(.black)
                
                ZStack() {
                    HStack(spacing: 10) {
                        Button(action: {
                            // Create New button action
                        }) {
                            Text("Create New")
                                .font(Font.custom("Inter", size: 20))
                                .lineSpacing(17.50)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .frame(width: 132, height: 38)
                        .background(Color(red: 0.23, green: 0.22, blue: 0.22))
                        .cornerRadius(10)
                        .offset(x: 0, y: 247)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 362, height: 313)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .offset(x: -0.12, y: 59.50)
                    
                    VStack(spacing: 20) {
                        TextField("Group Name", text: $groupName)
                            .font(Font.custom("Inter", size: 16).weight(.bold))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                        
                        TextField("Zip Code", text: $zipCode)
                            .font(Font.custom("Inter", size: 16).weight(.bold))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                        
                        TextField("Age", text: $age)
                            .font(Font.custom("Inter", size: 16).weight(.bold))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                        
                        Button(action: {
                            // Search button action
                        }) {
                            Text("Search")
                                .font(Font.custom("Inter", size: 20))
                                .lineSpacing(17.50)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .frame(width: 86, height: 44)
                        .background(Color(red: 0.23, green: 0.22, blue: 0.22))
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                    }
                    .frame(width: 361.50, height: 153.44)
                    .offset(x: 0.38, y: -189.28)
                }
                .frame(width: 362.25, height: 532)
                
                HStack(spacing: 70) {
                    NavigationLink(destination: Text("Home")) {
                        Text("H")
                            .font(Font.custom("Manrope", size: 20).weight(.semibold))
                            .lineSpacing(20)
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination: Text("Groups")) {
                        Text("G")
                            .font(Font.custom("Manrope", size: 20).weight(.semibold))
                            .lineSpacing(20)
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination: Text("Events")) {
                        Text("E")
                            .font(Font.custom("Manrope", size: 20).weight(.semibold))
                            .lineSpacing(20)
                            .foregroundColor(.white)
                    }
                    ZStack() {
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 25, height: 25)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 25, height: 25)
                }
                .padding(20)
                .frame(width: 330)
                .background(Color(red: 0.25, green: 0, blue: 0.40))
                .cornerRadius(30)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
            }
            .padding(EdgeInsets(top: 21, leading: 20, bottom: 21, trailing: 20))
            .frame(width: 390, height: 844)
            .background(Color(red: 0.67, green: 0.18, blue: 0.98))
        }
    }
}

struct Group_Previews: PreviewProvider {
    static var previews: some View {
        Group()
    }
}
