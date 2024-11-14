//
//  ListMatchsView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct ListMatchsView: View {
    @StateObject var vm: MatchViewModel
    var matchs: [Match]
    var body: some View {
        ForEach(matchs) { match in
            if vm.isArchiveMode {
                Button {
                    vm.addSimpleMatch(match)
                } label: {
                    MatchCellView(match: match, isChoose: vm.cheackContains(match))
                }
            }else {
                NavigationLink {
//                    PlayerView(player: player, vm: vm)
                } label: {
                    MatchCellView(match: match, isChoose: vm.cheackContains(match))
                }
            }
        }
    }
}


