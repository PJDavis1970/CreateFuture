//
//  ContentView.swift
//  iOSTakeHomeChallenge
//
//  Created by Martin Rist on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", image: "tabbarCharacters")
                }
        }
        .accentColor(.primary)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
