//
//  MovieCell.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct MovieCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("Tenet")
                    .resizable()
                    .frame(width: Constant.Screen.width/4, height: Constant.Screen.height/6)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5.0)
                    .shadow(color: .black, radius: 2.5)
                
                VStack {
                    textStyle(text: "Movie Title with long title",
                              alignment: .bottomLeading, weight: .bold, color: .black)
                    textStyle(text: "Movie description with long textttttttttttttttttttttt",
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
    MovieCell()
}
