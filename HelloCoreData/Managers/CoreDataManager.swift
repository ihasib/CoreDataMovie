//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by S. M. Hasibur Rahman on 2/1/23.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                print("Persistent store loading failed due to \(error.localizedDescription)")
                return
            }
            print("Persistent store loading successful")
        }
    }
    
    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext) //Movie gets registered to this viewContext
        movie.title = title
        do {
            try persistentContainer.viewContext.save()
            print("movie save successful")
        } catch {
            print("movie save failed due to \(error.localizedDescription)")
        }
    }

    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("movie update failed due to \(error.localizedDescription)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        var movies: [Movie] = []
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            try movies = persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("movies fetch failed due to \(error.localizedDescription)")
        }
        return movies
    }

    func removeMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Movie deletion failed due to \(error.localizedDescription)")
        }
    }
}
