//
//  TimerView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct TimerView: View {
    @StateObject var vm: MatchViewModel
    var body: some View {
        VStack{
            Text(vm.timeFormatted(vm.timeElapsed))
                .foregroundStyle(.blueApp)
                .font(.system(size: 34, weight: .bold))
            
            switch vm.timerStatus{
            case .ready:
                Button(action: vm.startTimer) {
                    VStack {
                        Text("Start match")
                            .foregroundColor(.white)
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(vm.simpleOpponent.isEmpty ? true : false)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(content: {
                        Color(vm.simpleOpponent.isEmpty ? .gray : .red)
                    })
                    .cornerRadius(10)
                }
            case .running:
                HStack{
                    //MARK: - End Match button
                    Button {
                        vm.stopTimer()
                    } label: {
                        VStack {
                            Text("End match")
                                .foregroundColor(.white)
                            Image(systemName: "stop.fill")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 32, height: 32)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }

                    
                    //MARK: - Pause match button
                    Button {
                        if vm.timerStatus == .running {
                            vm.pauseTimer()
                        }else {
                            vm.startTimer()
                        }
                    } label: {
                        VStack {
                            Text("Pause")
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .foregroundStyle(.blueApp)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blueApp.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            case .paused:
                HStack{
                    //MARK: - End Match button
                    Button {
                        vm.stopTimer()
                    } label: {
                        VStack {
                            Text("End match")
                                .foregroundColor(.white)
                            Image(systemName: "stop.fill")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 32, height: 32)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }

                    
                    //MARK: - Pause match button
                    Button {
                        if vm.timerStatus == .running {
                            vm.pauseTimer()
                        }else {
                            vm.startTimer()
                        }
                    } label: {
                        VStack {
                            Text("Pause")
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .foregroundStyle(.blueApp)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blueApp.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            case .stopped:
                Button(action: vm.startTimer) {
                    VStack {
                        Text("Resume match")
                            .foregroundColor(.white)
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orangeApp)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background {
            Color.whiteBlue.cornerRadius(20)
        }
    }
}

#Preview {
    TimerView(vm: MatchViewModel())
}
