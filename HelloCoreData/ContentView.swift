//
//  ContentView.swift
//  HelloCoreData
//
//  Created by S. M. Hasibur Rahman on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    var body: some View {
        VStack {
            TextField("Enter Movie name", text: $movieName)
            Button("Save", role: nil, action: {
                coreDM.saveMovie(title: movieName)
            })
            Button("Show All") {
                let movies = coreDM.getAllMovies()
                for movie in movies {
                    print(movie.title)
                }
            }
            
//            List(/)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
