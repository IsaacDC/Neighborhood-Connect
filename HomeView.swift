//
//  HomeView.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import SwiftUI

enum Tab: String, CaseIterable, Hashable {
    case magnifyingglass
    case plus
    case person
    case gear
}

struct HomeView: View {
    @Binding var selectedTab: Tab
    @State private var path = NavigationPath()

    private var filImage: String {
        selectedTab.rawValue + ".circle"
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                // Main content based on the selected tab
                if selectedTab == .magnifyingglass {
                    NavigationLink(value: "createGcView") {
                        EmptyView()
                    }.hidden()
                } else if selectedTab == .person {
                    NavigationLink(value: "chatsCreatedView") {
                        EmptyView()
                    }.hidden()
                } else if selectedTab == .gear {
                    NavigationLink(value: "settingsView") {
                        EmptyView()
                    }.hidden()
                } else if selectedTab == .plus {
                    NavigationLink(value: "CreateGroupChats") {
                        EmptyView()
                    }.hidden()
                }

                // Tab bar
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        Image(systemName: selectedTab == tab ? filImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .foregroundColor(selectedTab == tab ? .red : .gray)
                            .font(.system(size: 22))
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedTab = tab
                                    if tab == .person {
                                        path.append("chatsCreatedView")
                                    } else if tab == .magnifyingglass {
                                        path.append("createGcView")
                                    } else if tab == .gear {
                                        path.append("settingsView")
                                    } else if tab == .plus {
                                        path.append("CreateGroupChats")
                                    }
                                }
                            }
                        Spacer()
                    }
                }
                .frame(height: 45) // Adjusted height to be smaller
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding()
                .padding(.bottom, 34) // Adjust padding for safe area
            }
            .navigationDestination(for: String.self) { view in
                if view == "createGcView" {
                    createGcView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            path.removeLast()
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                        })
                } else if view == "chatsCreatedView" {
                    chatsCreatedView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            path.removeLast()
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                        })
                } else if view == "settingsView" {
                    settingsView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            path.removeLast()
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                        })
                } else if view == "CreateGroupChats" {
                    CreateGroupChats()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            path.removeLast()
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                        })
                }
            }
            .edgesIgnoringSafeArea(.all) // Ensure it respects safe area
        }
    }
    
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(.magnifyingglass))
    }
}
