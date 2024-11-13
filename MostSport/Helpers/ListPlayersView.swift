//
//  ListPlayersView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct ListPlayersView: View {
    @StateObject var vm: TeamViewModel
    var players: [Player]
    var body: some View {
        ForEach(players) { player in
            if vm.isArchiveMode {
                Button {
                    vm.addSimplePlayer(player)
                } label: {
                    PlayerCellView(player: player, isChoose: vm.cheackContains(player))
                }
            }else {
                NavigationLink {
                    PlayerView(player: player, vm: vm)
                } label: {
                    PlayerCellView(player: player)
                }
            }
        }
    }
}


