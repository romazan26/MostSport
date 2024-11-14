//
//  DashboardView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var vmCoach: CoachViewModel
    @StateObject var vmMatch: MatchViewModel
    @Binding var section: TableSection
    @Binding var ispresentAddPlayerView: Bool
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                //MARK: - User info
                NavigationLink {
                    CoachProfieView(vm: vmCoach)
                } label: {
                    if ((vmCoach.user?.name.isEmpty) == nil){
                        Text("Hello, Coach! Write your name and the name of your team here!")
                            .foregroundStyle(.text)
                            .padding(10)
                            .background {
                                Color.whiteBlue.cornerRadius(16)
                            }
                    }
                    else{
                        CoachCellView(coach: vmCoach.user)
                    }
                }

                //MARK: - Dashboard
                VStack(alignment: .leading){
                    Text("Dashboard")
                        .foregroundStyle(.text)
                        .font(.system(size: 28, weight: .bold))
                    
                    LazyVGrid(columns: [GridItem(spacing: 10),GridItem()]) {
                        DashboardCellView(nameCell: "Matches Played", image: "soccerball.inverse", count: "0")
                        DashboardCellView(nameCell: "Victories", image: "trophy.fill", count: "0")
                        DashboardCellView(nameCell: "Defeats", image: "hand.thumbsdown.fill", count: "0")
                        DashboardCellView(nameCell: "Draw", image: "figure.2", count: "0")
                        DashboardCellView(nameCell: "Win Percentage", image: "percent", count: "0")
                        DashboardCellView(nameCell: "Goals", image: "figure.indoor.soccer", count: "0")
                        DashboardCellView(nameCell: "Penalties", image: "xmark.app.fill", count: "0")
                        DashboardCellView(nameCell: "Avg Match Duration", image: "clock.fill", count: "00:00:00")
                    }.clipShape(RoundedRectangle(cornerRadius: 16))
                }
                //MARK: - Goup of button
                HStack {
                    //MARK: Add new player button
                    Button {
                        section = .team
                        ispresentAddPlayerView = true
                    } label: {
                        CustomButtonDashboardBigView(text: "Add new Player", image: "person.fill.badge.plus")
                    }
                    
                    //MARK: Start match button
                    NavigationLink {
                        StartMathView(vm: vmMatch)
                    } label: {
                        CustomButtonDashboardBigView(color: .red, text: "Start match", image: "play.fill")
                    }
                    
                }
                
                //MARK: - Matcges
                VStack{
                    HStack{
                        Text("Last matches")
                        
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                    }.foregroundStyle(.text)
                    Text("you dont have any matches yet. You can create a match in the «Matches» tab")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.text)
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    NavigationView {
        DashboardView(vmCoach: CoachViewModel(), vmMatch: MatchViewModel(), section: .constant(.dashboard), ispresentAddPlayerView: .constant(true))
    }
}
