//
//  CustomButtonDashboardBigView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct CustomButtonDashboardBigView: View {
    var color: Color = .whiteBlue
    var text: String
    var image: String
    var body: some View {
        VStack {
            Text(text)
            Image(systemName: image)
                .resizable()
                .frame(width: 32, height: 32)
        }
        .foregroundStyle(color == .whiteBlue ? .text : .white)
        .frame(minHeight: 68)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(color)
        .cornerRadius(16)
    }
}

#Preview {
    CustomButtonDashboardBigView(text: "Add new player", image: "person")
}
