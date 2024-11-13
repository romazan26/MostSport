//
//  ArchivePlayersView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct ArchivePlayersView: View {
    @StateObject var vm: TeamViewModel
    var body: some View {
        VStack{
            //MARK: - Choose sort view
            SortingButtonView(sortingType: $vm.sortingType).padding(.top, 5)
            
            //MARK: - List Players
            ScrollView {
                if vm.archivePlayers.isEmpty {
                    Text("you dont have any matches yet. You can create a match by clicking on the plus button")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.text)
                        .padding(.top)
                }else {
                    if vm.sortingType {
                        GridListPlayersView(vm: vm, players: vm.archivePlayers)
                    }else{
                        ListPlayersView(vm: vm, players: vm.archivePlayers)
                    }
                }
            }
            
            //MARK: - Group of buttons
            if !vm.simplePlayers.isEmpty {
                HStack {
                    //MARK: - Delete button
                    Button {
                        vm.simplePlayers.removeAll()
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
                        vm.saveRemoveForArchive()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 28, height: 28)
                    }
                    .padding(10)
                    .background {
                        Color(.green).cornerRadius(10)
                    }
                    
                }
            }
            
                
        }.padding()
            .navigationTitle("Players archivve")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArchivePlayersView(vm: TeamViewModel())
}
