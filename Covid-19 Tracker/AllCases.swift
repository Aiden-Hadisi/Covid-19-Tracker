//
//  AllCountries.swift
//  Covid-19 Tracker
//
//  Created by CSUFTitan on 3/29/20.
//  Copyright © 2020 Aiden Hadisi. All rights reserved.
//

import SwiftUI




struct AllCases: View {
    @State private var name:String = ""
    var body: some View {
        NavigationView{
        ZStack{
            Color(red: 133 / 255, green: 198 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Search Countries")
            
            }
                 
        }
        }.navigationBarTitle("Test")
 
    }
    

    
}
