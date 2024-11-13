//
//  GridListPlayersView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct GridListPlayersView: View {
    @StateObject var vm: TeamViewModel
    var players: [Player]
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(players) { player in
                if vm.isArchiveMode {
                    Button {
                        vm.addSimplePlayer(player)
                    } label: {
                        PlayerCellGridView(player: player, isChoose: vm.cheackContains(player))
                    }
                }else {
                    NavigationLink {
                        PlayerView(player: player, vm: vm)
                    } label: {
                        PlayerCellGridView(player: player)
                    }

                }
                
            }
        }
    }
}


