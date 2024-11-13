//
//  MatchViewModel.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import Foundation
import CoreData

final class MatchViewModel: ObservableObject {
    @Published var teamName: String = ""
    
    @Published var timeElapsed: TimeInterval = 0.0
    @Published var timerRunning = false
     private var timer: Timer? = nil
    
    init() {
        loadTeamName()
    }
    
    //MARK: - Load team name function
    func loadTeamName() {
        if let savedUserData = UserDefaults.standard.data(forKey: "user"),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            teamName = decodedUser.team
        }
    }
    
    //MARK: - timer function
    func startTimer() {
            timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
                timeElapsed += 0.1
            }
        }

        func stopTimer() {
            timerRunning = false
            timer?.invalidate()
            timer = nil
        }

        func resetTimer() {
            timerRunning = false
            timer?.invalidate()
            timer = nil
            timeElapsed = 0.0
        }

    func timeFormatted(_ totalSeconds: TimeInterval) -> String {
        let hours = Int(totalSeconds) / 3600
        let minutes = (Int(totalSeconds) % 3600) / 60
        let seconds = Int(totalSeconds) % 60
        let milliseconds = Int((totalSeconds - floor(totalSeconds)) * 100)
        return String(format: "%02d:%02d:%02d.%02d", hours, minutes, seconds, milliseconds)
    }
}
