//
//  MatchCellView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct MatchCellView: View {
    @ObservedObject var match: Match
    var isChoose: Bool = false
    var body: some View {
        HStack {
            //MARK: - Name teams
            VStack {
                Text(match.team ?? "")
                    
                    .font(.system(size: 17, weight: .bold))
                Text("vs")
                Text(match.opponent ?? "")
                    
                    .font(.system(size: 17, weight: .bold))
            }.foregroundStyle(isChoose ? .white : .text)
            Spacer()
            
            //MARK: - Info match
            VStack{
                Text("\(match.yourScore):\(match.oppScore)")
                    .font(.system(size: 28, weight: .bold))
                Text(match.matchTime ?? "")
                Text(Dateformatter(date: match.date ?? Date()))
            }.foregroundStyle(isChoose ? .white : .text)
        }
        .padding()
        .padding(.horizontal)
        .background {
            Color(isChoose ? .blueApp : .whiteBlue)
                .cornerRadius(16)
        }
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }

}

//#Preview {
//    MatchCellView()
//}
