//
//  AllCountries.swift
//  Covid-19 Tracker
//
//  Created by CSUFTitan on 3/29/20.
//  Copyright © 2020 Aiden Hadisi. All rights reserved.
//

import SwiftUI




struct SearchCases: View {
    @State private var text = ""
    @State private var showingAlert = false
    var body: some View {
        ZStack{
            Color(red: 133 / 255, green: 198 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                Text("Search")
                TextField("Enter Country Name", text: $text)
                
                
            
            }
                 
        }
 
    }
    

    

    
}
