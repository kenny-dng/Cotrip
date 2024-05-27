//
//  ContentView.swift
//  CoTrip
//
//  Created by Kenny DUONG on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstTime: Bool = true
    
    var body: some View {
        
        if firstTime {
            OnBoarding(firstTime: $firstTime)
        } else {
            TabView {
                Recherche()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                Favoris()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoris")
                    }
                
                Boarding()
                    .tabItem {
                        Image(systemName: "suitcase")
                        Text("Voyages")
                    }
                
                DashboardView()
                    .tabItem {
                        Image(systemName: "ellipses.bubble")
                        Text("Chat")
                    }
                
                ProfileTab()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profil")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
