//
//  ArchiveMatchsView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct ArchiveMatchsView: View {
    @StateObject var vm: MatchViewModel
    var body: some View {
        VStack {
            
            //MARK: - List Matchs
            ScrollView {
                if vm.archiveMatchs.isEmpty {
                    Text("You don't have any matches yet. You can create a match in the «Matches» tab")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.text)
                        .padding(.top)
                }else {
                    ListMatchsView(vm: vm, matchs: vm.archiveMatchs)
                }
            }
            //MARK: - Group of buttons
            if !vm.simpleMatchs.isEmpty {
                HStack {
                    //MARK: - Delete button
                    Button {
                        vm.simpleMatchs.removeAll()
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
            
               
        }
        .padding()
        .navigationTitle("Archive Matchs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArchiveMatchsView(vm: MatchViewModel())
}
