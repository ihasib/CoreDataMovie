//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Hasibur Rahman on 3/1/23.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    let coreDM: CoreDataManager
    @State private var movieTitle: String = ""
    @Binding var needsRefresh: Bool
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieTitle)
            Button("Update") {
                movie.title = movieTitle
                coreDM.updateMovie()
                needsRefresh.toggle()
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        MovieDetail(movie: movie, coreDM: coreDM,needsRefresh: .constant(false))
    }
}
