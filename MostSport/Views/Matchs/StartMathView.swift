//
//  StartMathView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct StartMathView: View {
    @StateObject var vm: MatchViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var isFocused: Bool
    var body: some View {
        VStack(spacing: 20){
            
            //MARK: - Info match
            if vm.timerStatus == .ready {
                OpponentAndDateView(nameOpponent: $vm.simpleOpponent, date: $vm.simpleDate)
                    .focused($isFocused)
            }
            
            //MARK: - Timer
            TimerView(vm: vm)
            
            //MARK: - Score match
            if vm.timerStatus != .ready{
                ScoreEditView(team1: vm.teamName, team2: vm.simpleOpponent, yourScore: $vm.simpleYourScore, oppScore: $vm.simpleOpponentScore)
            }
            
            Spacer()
            
            //MARK: - Save button
            if vm.timerStatus == .stopped {
                Button {
                    vm.addMatch()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.green)
                }

            }
                
        }
        .onTapGesture {
            isFocused = false
        }
        .navigationTitle("Start match")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    NavigationView {
        StartMathView(vm: MatchViewModel())
    }
}
