//
//  HomeView.swift
//  Cap2IOSProject
//
//  Created by Alessandro Escobar on 7/11/24.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case magnifyingglass
    case plus
    case person
    
    
    
    
}

struct HomeView: View {
    @Binding var selectedTab: Tab
    
    
    private var filImage: String{
        selectedTab.rawValue + ".circle"
        
        
       
        
        
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? filImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25: 1.0)
                        .foregroundColor(selectedTab == tab ? .red : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 55)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(.magnifyingglass))
    
    
}
