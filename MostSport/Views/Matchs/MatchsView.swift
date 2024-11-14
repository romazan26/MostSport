//
//  MatchsView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct MatchsView: View {
    @StateObject var vm: MatchViewModel
    var body: some View {
        ZStack {
            //MARK: - Team view
            VStack {
                //MARK: - Team name
                HStack {
                    Text(vm.teamName)
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    
                    //MARK: - Archive view button
                    NavigationLink {
                        ArchiveMatchsView(vm: vm).onAppear {
                            vm.isArchiveMode = true
                        }
                    } label: {
                        Image(systemName: "archivebox.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                }
                .padding(.vertical)
                .foregroundStyle(.text)

                //MARK: - List Players
                ScrollView {
                    if vm.noArchiveMatchs.isEmpty {
                        Text("You don't have any matches yet. You can create a match in the «Matches» tab")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.text)
                            .padding(.top)
                    }else {
                        ListMatchsView(vm: vm, matchs: vm.noArchiveMatchs)
                    }
                }
                Spacer()
                //MARK: - Goup of button
                if vm.isArchiveMode{
                    HStack {
                        //MARK: - Delete button
                        Button {
                            vm.isArchiveMode = false
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
                            vm.saveAddingForArchive()
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
                        //MARK: - ArchiveMode button
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
                        
                        //MARK: - Add match button
                        NavigationLink {
                            StartMathView(vm: vm)
                        } label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 28, height: 28)
                        }
                        .padding(10)
                        .background {
                            Color(.orangeApp).cornerRadius(10)
                        }

                        
                    }
                }
                    
            }
            .padding()
            .onAppear {
                vm.sortedMatchs()
            }
            
        }.onAppear {
            vm.isArchiveMode = false
        }
    }
}

#Preview {
    MatchsView(vm: MatchViewModel())
}
