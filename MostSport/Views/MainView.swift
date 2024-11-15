//
//  MainView.swift
//  MostSport
//
//  Created by Роман on 11.11.2024.
//

import SwiftUI

struct MainView: View {
    
    @State var sections: TableSection = .dashboard
    
    @StateObject var vmCoach = CoachViewModel()
    @StateObject var vmTeam = TeamViewModel()
    @StateObject var vmMatch = MatchViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.whiteBlue
    }
    var body: some View {
        NavigationView {
            TabView(selection: $sections) {
                DashboardView(vmCoach: vmCoach,
                              vmMatch: vmMatch,
                              vmTeam: vmTeam,
                              section: $sections,
                              ispresentAddPlayerView: $vmTeam.isPresetnAddPlayerView)
                    .tabItem {CustomTabItemView(image: "square.split.2x2.fill",
                                                text: "Dashboard")}.tag(TableSection.dashboard)
                TeamView(vm: vmTeam)
                    .tabItem {CustomTabItemView(image: "person.3.fill",
                                                text: "My Team")}.tag(TableSection.team)
                MatchsView(vm: vmMatch)
                    .tabItem {CustomTabItemView(image: "soccerball.inverse",
                                                text: "Matches")}.tag(TableSection.matches)
                SettingsView()
                    .tabItem {CustomTabItemView(image: "gearshape.fill",
                                                text: "Settings")}.tag(TableSection.settings)
            }
        }
    }
}

#Preview {
    MainView()
}
