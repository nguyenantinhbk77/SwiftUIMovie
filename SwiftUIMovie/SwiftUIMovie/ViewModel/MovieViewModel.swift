//
//  MovieViewModel.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    
    func readLocalJSON(file name: String)  async throws -> Data? {
        
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(filePath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            Logger.log("error is: \(error.localizedDescription)")
        }
        return nil
    }
}
