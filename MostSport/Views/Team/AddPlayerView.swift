//
//  AddPlayerView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct AddPlayerView: View {

    @StateObject var vm = PlayerViewModel()
    @StateObject var vmTeame: TeamViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.5)
            VStack(spacing: 20) {
                //MARK: - Pplayer info
                VStack {
                    //MARK: Number
                    CellAddPlayerView(nameCell: "Number", simpleText: $vm.simpleNumber)
                    //MARK: Name
                    CellAddPlayerView(nameCell: "Player name", simpleText: $vm.simpleName)
                    //MARK: Position
                    CellAddPlayerView(nameCell: "Position", simpleText: $vm.simplePosition)
                    //MARK: Goals
                    CellAddPlayerView(nameCell: "Goals", simpleText: $vm.simpleGoals)
                    //MARK: Assists
                    CellAddPlayerView(nameCell: "Assists", simpleText: $vm.simpleAssists)
                    //MARK: Number
                    CellAddPlayerView(nameCell: "Yellow cards", simpleText: $vm.simpleYellowCards)
                    //MARK: Number
                    CellAddPlayerView(nameCell: "Red cards", simpleText: $vm.simpleRedCards)
                }
                .foregroundStyle(.black)
                .padding()
                .background {
                    Color.white.cornerRadius(10)
                }
                
                //MARK: - Goup of button
                HStack {
                    //MARK: - Delete button
                    Button {
                        vm.clearSimpleData()
                    } label: {
                        Image(systemName: "xmark.app.fill")
                            .resizable()
                            .foregroundStyle(vm.simpleName.isEmpty ? .whiteBlue : .red)
                    }
                    .frame(width: 48, height: 48)
                    
                    //MARK: - Save button
                    Button {
                        vm.addPlayer()
                        vmTeame.isPresetnAddPlayerView = false
                        vmTeame.getData()
                    } label: {
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .foregroundStyle(vm.simpleName.isEmpty ? .whiteBlue : .green)
                    }
                    .frame(width: 48, height: 48)
                    
                }
            }.padding()
        }.onTapGesture {
            vmTeame.isPresetnAddPlayerView = false
            vm.clearSimpleData()
        }
    }
}

#Preview {
    ZStack {
        Color.black
        AddPlayerView(vmTeame: TeamViewModel())
    }
}
