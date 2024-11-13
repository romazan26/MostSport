//
//  AddPlayerView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct AddPlayerView: View {

    @StateObject var vm: TeamViewModel
    @FocusState var isFocused: Bool
    
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
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Name
                    CellAddPlayerView(nameCell: "Player name", simpleText: $vm.simpleName)
                        .focused($isFocused)
                    //MARK: Position
                    CellAddPlayerView(nameCell: "Position", simpleText: $vm.simplePosition)
                        .focused($isFocused)
                    //MARK: Goals
                    CellAddPlayerView(nameCell: "Goals", simpleText: $vm.simpleGoals)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Assists
                    CellAddPlayerView(nameCell: "Assists", simpleText: $vm.simpleAssists)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Number
                    CellAddPlayerView(nameCell: "Yellow cards", simpleText: $vm.simpleYellowCards)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Number
                    CellAddPlayerView(nameCell: "Red cards", simpleText: $vm.simpleRedCards)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
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
                        if vm.isEditMode{
                            vm.editPlayer()
                        }else{
                            vm.addPlayer()
                            vm.isPresetnAddPlayerView = false
                            vm.getData()
                        }
                        
                    } label: {
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .foregroundStyle(vm.simpleName.isEmpty ? .whiteBlue : .green)
                    }
                    .frame(width: 48, height: 48)
                    .disabled(vm.simpleName.isEmpty ? true : false)
                    
                }
            }
            .onTapGesture {
                isFocused = false
            }
            .padding()
        }.onTapGesture {
            vm.isPresetnAddPlayerView = false
            vm.clearSimpleData()
        }
    }
}

#Preview {
    ZStack {
        Color.black
        AddPlayerView(vm: TeamViewModel())
    }
}
