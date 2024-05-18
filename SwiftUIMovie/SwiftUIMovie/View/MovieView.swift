//
//  MovieView.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct MovieView: View {
    
    @StateObject var viewmodel = MovieViewModel()
    
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
        }
    }
}

#Preview {
    MovieView()
}
