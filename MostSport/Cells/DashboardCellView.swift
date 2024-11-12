//
//  DashboardCellView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct DashboardCellView: View {
    var nameCell: String
    var image: String
    var count: String
    var body: some View {
        VStack {
            HStack {
                Text(nameCell)
                Spacer()
                Image(systemName: image)
            }
            Spacer()
            Text("\(count)")
                .font(.system(size: 22, weight: .bold))
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(height: 68)
        .padding(10)
        .background(content: {
            Color.blueApp
        })
        
    }
}

#Preview {
    DashboardCellView(nameCell: "Matches Played", image: "star.fill", count: "0")
}
