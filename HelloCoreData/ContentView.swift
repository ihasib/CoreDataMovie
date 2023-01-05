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
    @State private var movies: [Movie] = []
    var body: some View {
        VStack {
            TextField("Enter Movie name", text: $movieName)
            Button("Save", role: nil, action: {
                coreDM.saveMovie(title: movieName)
                movies = coreDM.getAllMovies()
            })
            Button("Show All") {
                movies = coreDM.getAllMovies()
                for movie in movies {
                    print(movie.title)
                }
            }

            List {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetail(movie: movie), label: { Text(movie.title ?? "")}
                    )
                    Text(movie.title ?? "")
                }.onDelete(perform: {indexSet in
                    indexSet.forEach { index in
                        let selectedMovie = movies[index]
                        coreDM.removeMovie(movie: selectedMovie)
                        movies = coreDM.getAllMovies()
                    }
                })
            }
            Spacer()
        }
        .onAppear() {
            movies = coreDM.getAllMovies()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(coreDM: CoreDataManager())
                .previewInterfaceOrientation(.portrait)
            ContentView(coreDM: CoreDataManager())
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView(coreDM: CoreDataManager())
            ContentView(coreDM: CoreDataManager())
        }
    }
}
