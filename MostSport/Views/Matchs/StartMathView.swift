//
//  StartMathView.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import SwiftUI

struct StartMathView: View {
    @StateObject var vm: MatchViewModel
    var body: some View {
        Text(vm.timeFormatted(vm.timeElapsed))
        HStack(spacing: 20) {
            Button(action: vm.startTimer) {
                            Text("Старт")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
            .disabled(vm.timerRunning) // Кнопка заблокирована при запущенном таймере

            Button(action: vm.stopTimer) {
                            Text("Стоп")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
            .disabled(!vm.timerRunning) // Кнопка заблокирована, если таймер не запущен

            Button(action: vm.resetTimer) {
                            Text("Сброс")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
    }
}

#Preview {
    StartMathView(vm: MatchViewModel())
}
