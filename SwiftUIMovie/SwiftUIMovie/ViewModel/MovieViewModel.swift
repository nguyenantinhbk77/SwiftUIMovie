//
//  MovieViewModel.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var movieList = [MovieModel]()
    @Published var showCustomActionSheet = false
    
    let api: MovieFetch
    var cancellables = Set<AnyCancellable>()
    
    init(api: MovieFetch = DefaultMovieFetch()) {
        self.api = api
    }
    
    func readLocalJson(file name: String) async throws -> Data? {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let fileUrl = URL(filePath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            } catch {
                Logger.log("Error reading JSON file: \(error.localizedDescription)")
                throw error
            }
        } else {
            Logger.log("File not found: \(name).json")
        }
        return nil
    }

    @MainActor
    func loadMovie() async throws {
        let jsonData = try await readLocalJson(file: "MovieList")
        guard let data = jsonData else { return }
        
        api.fetchMovie(from: data)
            .sink { completion in
                Logger.log("status: \(completion)")
            } receiveValue: { [weak self] movies in
                guard let self = self else { return }
                Logger.log("array: \(movies)")
                movieList = movies
            }
            .store(in: &cancellables)
    }
    
    func sortByTitle() {
        movieList.sort { $0.title.rawValue < $1.title.rawValue }
    }
    
    func sortByReleaseDate() {
        movieList.sort { $0.releasedDate < $1.releasedDate }
    }
}
