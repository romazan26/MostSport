//
//  PlayerCellGridView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct PlayerCellGridView: View {
    @ObservedObject var player: Player
    var isChoose: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("\(player.number) \(player.playerName ?? "")")
                    .font(.system(size: 17, weight: .bold))
                Text("\(player.position ?? "")")
                Text("Matches: \(player.matchsPlayed)")
            }.foregroundStyle(isChoose ? .white : .text)
            Spacer()
            HStack {
                VStack{
                    Text("G")
                    Divider()
                    Text("\(player.goals)")
                }.foregroundStyle(isChoose ? .white : .green)
                VStack{
                    Text("A")
                    Divider()
                    Text("\(player.assists)")
                }.foregroundStyle(isChoose ? .white : .blueApp)
                VStack{
                    Text("YC")
                    Divider()
                    Text("\(player.yellowCard)")
                }.foregroundStyle(isChoose ? .white : .orange)
                VStack{
                    Text("RC")
                    Divider()
                    Text("\(player.redCards)")
                }.foregroundStyle(isChoose ? .white : .red)
            }.frame(maxHeight: 142)
            
        }.padding()
            .background {
                Color(isChoose ? .blueApp : .whiteBlue)
                    .cornerRadius(16)
            }
    }
}

//#Preview {
//    PlayerCellGridView(player: Player())
//}
