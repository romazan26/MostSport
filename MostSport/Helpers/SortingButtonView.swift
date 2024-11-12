//
//  SortingButtonView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct SortingButtonView: View {
    @Binding var sortingType: Bool
    var body: some View {
        VStack(alignment: .leading){
            Text("Sorting").foregroundStyle(.text)
                .font(.system(size: 17))
    
            HStack {
                Button {
                    sortingType = false
                } label: {
                    Image(systemName: "square.split.1x2.fill")
                        .resizable()
                        .foregroundStyle(sortingType ? .gray : .white)
                        .frame(width: 28, height: 28)
                }
                .padding(10)
                .background {
                    Color((sortingType ? .whiteBlue : .blueApp)).cornerRadius(10)
                }
                
                Button {
                    sortingType = true
                } label: {
                    Image(systemName: "square.split.2x2.fill")
                        .resizable()
                        .foregroundStyle(!sortingType ? .gray : .white)
                        .frame(width: 28, height: 28)
                }
                
                .padding(10)
                .background {
                    Color((!sortingType ? .whiteBlue : .blueApp)).cornerRadius(10)
                }
                Spacer()
            }
                
        }
    }
}

#Preview {
    SortingButtonView(sortingType: .constant(false as Bool))
}
