//
//  EditMatchView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct EditMatchView: View {
    @StateObject var vm: MatchViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.5)
            VStack(spacing: 20) {
                //MARK: - Matc info
                VStack {
                    //MARK: Opponents
                    CellAddPlayerView(nameCell: "Opponents", simpleText: $vm.simpleOpponent)
                        .focused($isFocused)
                        
                    //MARK: Your score
                    CellAddPlayerView(nameCell: "Your score", simpleText: $vm.simpleYourScore)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Opp score
                    CellAddPlayerView(nameCell: " Opp score", simpleText: $vm.simpleOpponentScore)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    //MARK: Time
                    CellAddPlayerView(nameCell: "time", simpleText: $vm.simpleTime)
                        .focused($isFocused)
                    //MARK: date
                    DatePicker("Date", selection: $vm.simpleDate, displayedComponents: .date)
                    
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
                        vm.clearMatchData()
                    } label: {
                        Image(systemName: "xmark.app.fill")
                            .resizable()
                            .foregroundStyle(vm.simpleOpponent.isEmpty ? .whiteBlue : .red)
                    }
                    .frame(width: 48, height: 48)
                    
                    //MARK: - Save button
                    Button {
                        vm.editMatch()

                    } label: {
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .foregroundStyle(vm.simpleOpponent.isEmpty ? .whiteBlue : .green)
                    }
                    .frame(width: 48, height: 48)
                    .disabled(vm.simpleOpponent.isEmpty ? true : false)
                    
                }
            }
            .onTapGesture {
                isFocused = false
            }
            .padding()
        }.onTapGesture {
            vm.isPresentEditMatchView = false
            vm.clearMatchData()
        }
    }
    
}

#Preview {
    EditMatchView(vm: MatchViewModel())
}
