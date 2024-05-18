//
//  MovieModel.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import Foundation

struct MovieModel: Codable {
    let title: MovieTitle
    let description, rating, duration: String
    let genre, releasedDate: String
    let trailerLink: String
    
    var formattedReleaseData: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        if let date = dateFormatter.date(from: releasedDate) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    var id: MovieTitle { title }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case rating = "Rating"
        case duration = "Duration"
        case genre = "Genre"
        case releasedDate = "Released date"
        case trailerLink = "Trailer Link"
    }
    
    enum MovieTitle: String, Codable {
        case tenet = "Tenet"
        case spiderMan = "Spider-Man: Into the Spider-Verse"
        case knivesOut = "Knives Out"
        case guardianOfGalaxy = "Guardians of the Galaxy"
        case avengers = "Avengers: Age of Ultron"
        
        var coverImage: String {
            switch self {
                case .tenet:
                    return "Tenet"
                case .spiderMan:
                    return "Spider Man"
                case .knivesOut:
                    return "Knives Out"
                case .guardianOfGalaxy:
                    return "Guardians of The Galaxy"
                case .avengers:
                    return "Avengers"
            }
        }
    }
}

