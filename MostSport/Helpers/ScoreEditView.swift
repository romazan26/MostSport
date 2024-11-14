//
//  ScoreEditView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct ScoreEditView: View {
    @State private var score1: Int = 0
    @State private var score2: Int = 0
    @State var team1: String = "Martines"
    @State var team2: String = "Martines"
    @Binding var yourScore: String
    @Binding var oppScore: String
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(team1)
                    .foregroundStyle(.blueApp)
                HStack{
                    Button {if score1 > 0 {
                        score1 -= 1
                        yourScore = "\(score1)"
                    }
                            
                    } label: {
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.whiteBlue)
                    }
                    Button {
                        score1 += 1
                        yourScore = "\(score1)"
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.whiteBlue)
                    }

                }
            }
            Spacer()
            Text("\(score1):\(score2)")
                .foregroundStyle(.text)
                .font(.system(size: 34, weight: .bold,design: .monospaced))
                
            Spacer()
            VStack(alignment: .leading){
                Text(team2)
                    .foregroundStyle(.blueApp)
                HStack{
                    Button {if score2 > 0 {
                        score2 -= 1
                        oppScore = "\(score2)"
                    }
                            
                    } label: {
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.whiteBlue)
                    }
                    Button {
                        score2 += 1
                        oppScore = "\(score2)"
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.whiteBlue)
                    }

                }
            }
        }
    }
}

#Preview {
    ScoreEditView(yourScore: .constant(""), oppScore: .constant(""))
}
