//
//  PlayerView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct PlayerView: View {
    
    @ObservedObject var player: Player
    @StateObject var vm: TeamViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            //MARK: - Player view
            VStack {
                //MARK: - Dashboard player info
                LazyVGrid(columns: [GridItem(spacing: 10),GridItem()]) {
                    DashboardCellView(nameCell: "Position",
                                      image: "sportscourt.fill",
                                      count: "\(player.position ?? "")",
                                      color: .whiteBlue,
                                      textColor: .blueApp)
                    DashboardCellView(nameCell: "Matches Played",
                                      image: "soccerball.inverse",
                                      count: "\(player.matchsPlayed)",
                                      color: .whiteBlue,
                                      textColor: .blueApp)
                    DashboardCellView(nameCell: "Goals",
                                      image: "figure.indoor.soccer",
                                      count: "\(player.goals)",
                                      color: .green)
                    DashboardCellView(nameCell: "Assists",
                                      image: "figure.2",
                                      count: "\(player.assists)")
                    DashboardCellView(nameCell: "Yellow card",
                                      image: "xmark.app.fill",
                                      count: "\(player.yellowCard)",
                                      color: .orange)
                    DashboardCellView(nameCell: "Red card",
                                      image: "xmark.app.fill",
                                      count: "\(player.redCards)",
                                      color: .red)
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
                
                
                    //MARK: - Delete button
                    Button {
                        vm.deletePlayer(player)
                        dismiss()
                    } label: {
                        Image(systemName: "archivebox.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 28, height: 28)
                    }
                    .padding(10)
                    .background {
                        Color(.red).cornerRadius(10)
                    }
                .navigationTitle("\(player.number) \(player.playerName ?? "")")
                
            }
            .padding()
                        
            //MARK: - Edit player view
            if vm.isPresetnAddPlayerView {
                AddPlayerView(vm: vm)
            }
            
        }
        .toolbar {
            ToolbarItem {
                //MARK: - Edit button
                Button {
                    vm.isPresetnAddPlayerView = true
                    vm.feelData(player: player)
                    vm.selectedPlayer = player
                    vm.isEditMode = true
                } label: {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .foregroundStyle(.red)
                        .frame(width: 28, height: 28)
                }

            }
        }
        
        
    }
}
