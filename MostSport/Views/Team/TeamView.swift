//
//  TeamView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct TeamView: View {
    @StateObject var vm: TeamViewModel
    var body: some View {
        ZStack {
            //MARK: - Team view
            VStack {
                //MARK: - Team name
                HStack {
                    Text(vm.teamName)
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Image(systemName: "archivebox.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                }.foregroundStyle(.text)
                
                //MARK: - Choose sort view
                SortingButtonView(sortingType: $vm.sortingType).padding(.top, 5)
                
                //MARK: - List Players
                ScrollView {
                    if vm.players.isEmpty {
                        Text("you dont have any matches yet. You can create a match by clicking on the plus button")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.text)
                            .padding(.top)
                    }else {
                        if vm.sortingType {
                            LazyVGrid(columns: [GridItem(), GridItem()]) {
                                ForEach(vm.players) { player in
                                    if vm.isArchiveMode {
                                        Button {
                                            
                                        } label: {
                                            PlayerCellGridView(player: player)
                                        }
                                    }else {
                                        NavigationLink {
                                            
                                        } label: {
                                            PlayerCellGridView(player: player)
                                        }

                                    }
                                    
                                }
                            }
                        }else{
                            ForEach(vm.players) { player in
                                if vm.isArchiveMode {
                                    Button {
                                        
                                    } label: {
                                        PlayerCellView(player: player)
                                    }
                                }else {
                                    NavigationLink {
                                        
                                    } label: {
                                        PlayerCellView(player: player)
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }
                Spacer()
                //MARK: - Goup of button
                if vm.isArchiveMode{
                    HStack {
                        //MARK: - Delete button
                        Button {
                            vm.isArchiveMode = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundStyle(.blueApp)
                                .frame(width: 28, height: 28)
                        }
                        .padding(10)
                        .background {
                            Color(.whiteBlue).cornerRadius(10)
                        }
                        
                        //MARK: - Archive players button
                        Button {
                           /// vm.isPresetnAddPlayerView = true
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

                    }
                }else{
                    HStack {
                        //MARK: - Delete button
                        Button {
                            vm.isArchiveMode = true
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
                        
                        //MARK: - Add player button
                        Button {
                            vm.isPresetnAddPlayerView = true
                        } label: {
                            Image(systemName: "person.fill.badge.plus")
                                .resizable()
                                .foregroundStyle(.blueApp)
                                .frame(width: 28, height: 28)
                        }
                        .padding(10)
                        .background {
                            Color(.whiteBlue).cornerRadius(10)
                        }
                        
                    }
                }
                    
            }.padding()
            
            //MARK: - Add player view
            if vm.isPresetnAddPlayerView {
                AddPlayerView(vmTeame: vm)
            }
        }
    }
}

#Preview {
    TeamView(vm: TeamViewModel())
}
