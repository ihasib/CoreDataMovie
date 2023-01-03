//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Hasibur Rahman on 3/1/23.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    @State private var movieTitle: String = ""
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieTitle)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        MovieDetail(movie: movie)
    }
}
