//
//  ContentView.swift
//  SwiftUITrivia
//
//  Created by CSUFTitan on 3/8/20.
//  Copyright © 2020 Aiden Hadisi. All rights reserved.
//

import SwiftUI







struct ContentView: View {
    
 
    var body: some View {
        TabView {
            AllCases()
                .tabItem {
                    Image(systemName: "livephoto")
                    Text("WordWide")
                }
            AllCountriesView()
            .tabItem {
                Image(systemName: "flag")
                Text("All Countries")
            }

        }
        .font(.headline)
 
    }
    

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
