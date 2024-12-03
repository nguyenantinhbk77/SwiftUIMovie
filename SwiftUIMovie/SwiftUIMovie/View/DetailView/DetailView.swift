//
//  DetailView.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 19/5/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Image("Spider Man")
                    .resizable()
                    .frame(width: 120, height: 170)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.rect(cornerRadius: 5))
                    .shadow(color: .black, radius: 2.5)
                    .padding(.top, 10)
                    .padding(.leading, 16)
                
                VStack {
                    HStack {
                        Text("Spider Man: Into the Spider verse")
                            .frame(width: 170, height: 70, alignment: .leading)
                            .font(.system(size: 18, weight: .bold))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .padding(.leading, 5)
                            .padding(.trailing, 1)
                        
                        Text("8.2")
                            .frame(width: 30, height: 20)
                            .font(.system(size: 18, weight: .bold))
                        
                    }
                }
                
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    DetailView()
}
