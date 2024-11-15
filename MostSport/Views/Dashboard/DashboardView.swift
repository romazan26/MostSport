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
    @StateObject var vmTeam: TeamViewModel
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
                        DashboardCellView(nameCell: "Matches Played",
                                          image: "soccerball.inverse",
                                          count: "\(vmMatch.matchs.count)")
                        
                        DashboardCellView(nameCell: "Victories",
                                          image: "trophy.fill",
                                          count: vmMatch.getWinnerCount())
                        
                        DashboardCellView(nameCell: "Defeats",
                                          image: "hand.thumbsdown.fill",
                                          count: vmMatch.getDefeatCount())
                        
                        DashboardCellView(nameCell: "Draw",
                                          image: "figure.2",
                                          count: "\(vmTeam.players.count)")
                        
                        DashboardCellView(nameCell: "Win Percentage",
                                          image: "percent",
                                          count: "\(vmMatch.getPercentWinner())%")
                        
                        DashboardCellView(nameCell: "Goals",
                                          image: "figure.indoor.soccer",
                                          count: vmTeam.getGoalsCount())
                        
                        DashboardCellView(nameCell: "Penalties",
                                          image: "xmark.app.fill",
                                          count: vmTeam.getPenaltiesCount())
                        
                        DashboardCellView(nameCell: "Avg Match Duration",
                                          image: "clock.fill",
                                          count: vmMatch.matchs.last?.matchTime ?? "")
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
                
                //MARK: - Matches
                VStack{
                    HStack{
                        Text("Last matches")
                        
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                    }.foregroundStyle(.text)
                    if vmMatch.matchs.isEmpty {
                        Text("you dont have any matches yet. You can create a match in the «Matches» tab")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.text)
                    }else{
                        MatchCellView(match: vmMatch.matchs.last!)
                    }
                    
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    NavigationView {
        DashboardView(vmCoach: CoachViewModel(), vmMatch: MatchViewModel(), vmTeam: TeamViewModel(), section: .constant(.dashboard), ispresentAddPlayerView: .constant(true))
    }
}
