//
//  PlayerCellView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct PlayerCellView: View {
    @ObservedObject var player: Player
    var body: some View {
        HStack {
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
            }.frame(width: 128)
            
        }.padding()
            .background {
                Color.whiteBlue.cornerRadius(16)
            }
    }
}

//#Preview {
//    PlayerCellView()
//}
