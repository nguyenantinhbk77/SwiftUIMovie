//
//  FetchMovie.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import Combine
import Foundation

protocol MovieFetch {
    func fetchMovie(from data: Data) -> AnyPublisher<[MovieModel], Error>
}

class DefaultMovieFetch: MovieFetch {
    func fetchMovie(from data: Data) -> AnyPublisher<[MovieModel], any Error> {
        return Future<[MovieModel], Error> { promise in
            do {
                let decodedData = try JSONDecoder().decode([MovieModel].self, from: data)
                promise(.success(decodedData))
            } catch {
                Logger.log("decoder error:\(error.localizedDescription)")
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
