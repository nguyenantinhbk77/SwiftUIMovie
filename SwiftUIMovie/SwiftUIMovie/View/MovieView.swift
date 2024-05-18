//
//  MovieView.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct MovieView: View {
    
    @StateObject var viewmodel = MovieViewModel()
    @State private var showCustomActionSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewmodel.movieList) { movie in
                    MovieCell(movie: movie)
                }
            }
            .navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    showCustomActionSheet = true
                } label: {
                    Text("Sort")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.black)
                }
            }
            .onAppear {
                Task {
                    do {
                        try await viewmodel.loadMovie()
                    } catch {
                        Logger.log("could not load movies")
                    }
                }
            }
            .overlay {
                if showCustomActionSheet {
                    CustomActionSheet(showCustomActionSheet: $showCustomActionSheet) {
                        Logger.log("Calling sortByTItle")
                    } sortByReleaseDate: {
                        Logger.log("Calling sortByDate")
                    }
                }

            }
        }
    }
}

#Preview {
    MovieView()
}
