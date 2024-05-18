//
//  CustomActionSheet.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import SwiftUI

struct CustomActionSheet: View {
    
    @State private var cardOffSet: CGSize = CGSize(width: 0, height: Constant.Screen.height)
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        cardOffSet.height = Constant.Screen.height
                    }
                }
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: Constant.Screen.width * 0.9, height: Constant.Screen.height * 0.12)
                    .overlay {
                        VStack {
                            buttonWithText(title: "Title", weight: .medium, color: .gray)
                            
                            Divider()
                            
                            buttonWithText(title: "Released Date", weight: .medium, color: .gray)
                        }
                    }
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: Constant.Screen.width * 0.9, height: Constant.Screen.height * 0.065)
                    .overlay {
                        VStack {
                            buttonWithText(title: "Cancel", weight: .medium, color: .black)
                        }
                    }
               
            }
            .offset(cardOffSet)
            .onAppear {
                withAnimation {
                    cardOffSet.height = 0
                }
            }
        }
    }
    
    func buttonWithText(title: String, weight: Font.Weight, color: Color) -> some View {
        return Button {
            Logger.log("Title Tapped")
            withAnimation {
                cardOffSet.height = Constant.Screen.height
            }
        } label: {
            Text(title)
                .frame(width: Constant.Screen.width * 0.9)
                .font(.system(size: 18, weight: weight))
                .foregroundStyle(color)
        }
    }
}

#Preview {
    CustomActionSheet()
}
