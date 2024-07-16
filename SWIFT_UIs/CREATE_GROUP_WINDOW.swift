import SwiftUI

struct CreateGroup: View {
    @State private var groupName: String = ""
    @State private var zipCode: String = ""
    @State private var age: String = ""
    @State private var description: String = ""
    
    var body: some View {
        VStack(spacing: 60) {
            HStack {
                Spacer()
                Button(action: {
                    // Close button action
                }) {
                    Text("X")
                        .font(Font.custom("Inter", size: 20))
                        .lineSpacing(17.50)
                        .foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(Color(red: 0.23, green: 0.22, blue: 0.22))
                        .cornerRadius(2)
                }
            }
            .padding(.trailing)
            
            Text("Create your own group")
                .font(Font.custom("Inter", size: 32).weight(.bold))
                .lineSpacing(28.01)
                .foregroundColor(.black)
            
            VStack(spacing: 20) {
                TextField("Group Name", text: $groupName)
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                
                HStack(spacing: 20) {
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
                }
                
                TextField("Description", text: $description)
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                    .frame(height: 165)
                
                Button(action: {
                    // Create button action
                }) {
                    Text("Create")
                        .font(Font.custom("Inter", size: 20))
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 84, height: 38)
                        .background(Color(red: 0.23, green: 0.22, blue: 0.22))
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                }
            }
            .padding()
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            .frame(width: 250, height: 416.78)
        }
        .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
        .frame(width: 390, height: 550)
        .background(Color(red: 0.67, green: 0.18, blue: 0.98))
    }
}

struct CreateGroup_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroup()
    }
}
