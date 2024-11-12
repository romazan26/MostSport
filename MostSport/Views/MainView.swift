//
//  MainView.swift
//  MostSport
//
//  Created by Роман on 11.11.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmCoach = CoachViewModel()
    init() {
        UITabBar.appearance().backgroundColor = UIColor.whiteBlue
    }
    var body: some View {
        NavigationView {
            TabView {
                DashboardView(vmCoach: vmCoach)
                    .tabItem {CustomTabItemView(image: "square.split.2x2.fill",
                                                text: "Dashboard")}
                Text("Tab Content 2")
                    .tabItem {CustomTabItemView(image: "person.3.fill",
                                                text: "My Team")}
                Text("Tab Content 2")
                    .tabItem {CustomTabItemView(image: "soccerball.inverse",
                                                text: "Matches")}
                Text("Tab Content 2")
                    .tabItem {CustomTabItemView(image: "gearshape.fill",
                                                text: "Aettings")}
            }
        }
    }
}

#Preview {
    MainView()
}
