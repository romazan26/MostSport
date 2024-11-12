//
//  PlayerCellGridView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct PlayerCellGridView: View {
    @ObservedObject var player: Player
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("\(player.number) \(player.playerName ?? "")")
                    .font(.system(size: 17, weight: .bold))
                Text("\(player.position ?? "")")
                Text("Matches: \(player.matchsPlayed)")
            }.foregroundStyle(.text)
            Spacer()
            HStack {
                VStack{
                    Text("G")
                    Divider()
                    Text("\(player.goals)")
                }.foregroundStyle(.green)
                VStack{
                    Text("A")
                    Divider()
                    Text("\(player.assists)")
                }.foregroundStyle(.blueApp)
                VStack{
                    Text("YC")
                    Divider()
                    Text("\(player.yellowCard)")
                }.foregroundStyle(.orange)
                VStack{
                    Text("RC")
                    Divider()
                    Text("\(player.redCards)")
                }.foregroundStyle(.red)
            }.frame(maxHeight: 142)
            
        }.padding()
            .background {
                Color.whiteBlue.cornerRadius(16)
            }
    }
}

//#Preview {
//    PlayerCellGridView(player: Player())
//}
