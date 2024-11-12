//
//  CellAddPlayerView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct CellAddPlayerView: View {
    var nameCell: String
    @Binding var simpleText: String
    var body: some View {
        HStack {
            Text(nameCell)
                .frame(width: 100)
                
                      
            TextField(nameCell, text: $simpleText)
        }.foregroundStyle(.black)
    }
}


