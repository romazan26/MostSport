//
//  OpponentAndDateView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct OpponentAndDateView: View {
    @Binding var nameOpponent: String
    @Binding var date: Date
    var body: some View {
        VStack {
            HStack {
                Text("Opponent")
                TextField("", text: $nameOpponent)
            }
            Divider()
            DatePicker("Date", selection: $date, displayedComponents: .date)
        }
    }
}

#Preview {
    OpponentAndDateView(nameOpponent: .constant(""), date: .constant(Date()))
}

