//
//  ContentView.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.backgroundColor.edgesIgnoringSafeArea(.all)
                
                VStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .search:
                        Text("This will be the search screen")
                    case .profile:
                        Text("This will be the profile screen")
                    }
                }
                .padding(.horizontal, 8)
                
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 8)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
