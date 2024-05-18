//
//  MovieCell.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct MovieCell: View {
    
    let movie: MovieModel
    
    var body: some View {
        VStack {
            HStack {
                Image(movie.title.coverImage)
                    .resizable()
                    .frame(width: Constant.Screen.width/4, height: Constant.Screen.height/6)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5.0)
                    .shadow(color: .black, radius: 2.5)
                
                VStack {
                    textStyle(text: "\(movie.title.rawValue) (\(movie.formattedReleaseData))",
                              alignment: .bottomLeading, weight: .bold, color: .black)
                    textStyle(text: "\(movie.duration) - \(movie.genre)",
                              alignment: .topLeading, weight: .regular, color: .gray)
                }

            }
            
            Divider()
                .padding()
        }
    }
    
    func textStyle(text: String, alignment: Alignment, weight: Font.Weight, color: Color) -> some View {
        return Text(text)
            .frame(width: Constant.Screen.width/1.6, height: 60, alignment: alignment)
            .font(.system(size: 18, weight: weight))
            .foregroundColor(color)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding([.leading, .trailing], 5)
    }
}

#Preview {
    let data = MovieModel(title: .spiderMan, description: "", rating: "", duration: "", genre: "", releasedDate: "", trailerLink: "")
    return MovieCell(movie: data)
}
