//
//  MainView.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<10) { _ in
                    MainCell()
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
        }
    }
}

#Preview {
    MainView()
}
