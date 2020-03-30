//
//  AllCountries.swift
//  Covid-19 Tracker
//
//  Created by CSUFTitan on 3/29/20.
//  Copyright © 2020 Aiden Hadisi. All rights reserved.
//

import SwiftUI




struct AllCases: View {
    @State private var totalCases:Int = 0
    @State private var totalRecovered:Int = 0
    @State private var totalDeaths:Int = 0
    
    
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            Color(red: 133 / 255, green: 198 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            ScrollView {
            VStack(spacing: 30) {
                Image("Image").resizable()
                .frame(width: 100.0, height: 100.0)
                Text("Cases Worldwide").font(.largeTitle)
                VStack(spacing: 20) {
                    VStack{
                        Text("Total Cases")
                        Text(String(self.totalCases))
                    }
                    VStack{
                        Text("Total Deaths")
                        Text(String(self.totalDeaths))
                    }
                    VStack{
                        Text("Total Recovered")
                        Text(String(self.totalRecovered))
                    }
                    
                }.foregroundColor(.white)
                
                }.frame(width: geometry.size.width, height: geometry.size.height)
                
            
            }
            }
        }.onAppear(perform: loadData)
            
 
    }
    
    func loadData() {
        self.totalDeaths = 0
        self.totalCases = 0
        self.totalRecovered = 0
        guard let url = URL(string: "https://api.covid19api.com/summary") else {
            print("Invalid URL")
            return
        }
        var results = [Result]()
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder();
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let question = try decoder.decode(Response.self, from: data)
                    results = question.Countries
                    for item in results {
                        self.totalCases += item.TotalConfirmed
                        self.totalRecovered += item.TotalRecovered
                        self.totalDeaths += item.TotalDeaths
                    }
                }
                catch {
                    print(error)
                }
            }
            
        }.resume()
    }
    

    
}

