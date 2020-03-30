//
//  AllCountries.swift
//  Covid-19 Tracker
//
//  Created by CSUFTitan on 3/29/20.
//  Copyright © 2020 Aiden Hadisi. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var Countries: [Result]
}

struct Result: Codable {
    var Country: String
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered:Int
    var TotalRecovered:Int

}


struct AllCountriesView: View {
    
    @State private var results =  [Result]()
    init(){
          UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorColor = .white
      }
    var body: some View {
        ZStack{
            Color(red: 133 / 255, green: 198 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            
            List(results, id: \.Country) { item in
                if(item.Country != "") {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(item.Country).font(.largeTitle)
                    Text("Total Cases: \(String(item.TotalConfirmed)) (+\(String(item.NewConfirmed)))")
                    Text("Total Deaths: \(String(item.TotalDeaths)) (+\(String(item.NewDeaths)))")
                    Text("Total Recovered: \(String(item.TotalRecovered)) (+\(String(item.NewRecovered)))")
                }.foregroundColor(.white)
                }
            }

                 
        }.onAppear(perform: loadData)
 
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.covid19api.com/summary") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder();
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let question = try decoder.decode(Response.self, from: data)
                    self.results = question.Countries

                }
                catch {
                    print(error)
                }
            }
            
        }.resume()
    }
    
}
