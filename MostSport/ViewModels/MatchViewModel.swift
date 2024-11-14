//
//  MatchViewModel.swift
//  MostSport
//
//  Created by Роман on 13.11.2024.
//

import Foundation
import CoreData

enum Statustimer{
    case ready
    case running
    case paused
    case stopped
}

final class MatchViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var teamName: String = ""
    @Published var isArchiveMode = false
    @Published var sortingType = false
    @Published var isPresentEditMatchView = false
    
    //MARK: - Match propertys
    @Published var matchs: [Match] = []
    
    @Published var noArchiveMatchs: [Match] = []
    @Published var archiveMatchs: [Match] = []
    @Published var simpleMatchs: [Match] = []
    @Published var simpleMatch: Match?
    
    @Published var simpleOpponent: String = ""
    @Published var simpleYourScore: String = ""
    @Published var simpleOpponentScore: String = ""
    @Published var simpleDate = Date()
    @Published var simpleTime: String = ""
    
    //MARK: - Timer propertys
    @Published var timeElapsed: TimeInterval = 0.0
    @Published var timerStatus = Statustimer.ready
    private var timer: Timer? = nil
    
    init() {
        loadTeamName()
        getMatchs()
    }
    
    //MARK: - Delete match
    func delteMatch(_ match: Match) {
        manager.context.delete(match)
        saveMatchs()
        sortedMatchs()
    }
    
    //MARK: - FeelData
    func feelData(_ match: Match) {
        simpleOpponent = match.opponent ?? ""
        simpleYourScore = String(match.yourScore)
        simpleOpponentScore = String(match.oppScore)
        simpleDate = match.date ?? Date()
        simpleTime = match.matchTime ?? ""
        simpleMatch = match
    }
    
    //MARK: - Save edit for archive
    func saveRemoveForArchive() {
        for simpleMatch in simpleMatchs {
            for match in matchs {
                if simpleMatch.id == match.id {
                    match.isArchive = false
                }
            }
        }
        saveMatchs()
        simpleMatchs.removeAll()
        sortedMatchs()
    }
    
    func saveAddingForArchive() {
        for simpleMatch in simpleMatchs {
            for match in matchs {
                if simpleMatch.id == match.id {
                    match.isArchive = true
                }
            }
        }
        saveMatchs()
        simpleMatchs.removeAll()
        isArchiveMode = false
        sortedMatchs()
    }
    
    //MARK: - Get sorted players
    func sortedMatchs() {
        noArchiveMatchs.removeAll()
        archiveMatchs.removeAll()
        for match in matchs {
            if match.isArchive {
                archiveMatchs.append(match)
            }else{
                noArchiveMatchs.append(match)
            }
        }
    }
    
    func addSimpleMatch(_ match: Match) {
        if simpleMatchs.contains(match) {
            simpleMatchs.removeAll(where: { $0.id == match.id })
        }else {
            simpleMatchs.append(match)
        }
    }
    
    func cheackContains(_ match: Match) -> Bool {
        return simpleMatchs.contains(match)
    }
    
    //MARK: - CoreData function
    
    //MARK:  Edit data
    func editMatch(){
        let request = NSFetchRequest<Match>(entityName: "Match")
        do{
            matchs = try manager.context.fetch(request)
            let editMatch = matchs.first(where: { $0.id == simpleMatch?.id })
            editMatch?.opponent = simpleOpponent
            editMatch?.yourScore = Int16(simpleYourScore) ?? 0
            editMatch?.oppScore = Int16(simpleOpponentScore) ?? 0
            editMatch?.matchTime = simpleTime
            editMatch?.date = simpleDate
        }catch let error{
            print("Error: \(error)")
        }
        saveMatchs()
        isPresentEditMatchView = false
        clearMatchData()
    }
    
    //MARK: Clear simple data
    func clearMatchData(){
        simpleOpponent = ""
        simpleYourScore = ""
        simpleOpponentScore = ""
        simpleDate = Date()
    }
    
    //MARK:  Add data
    func addMatch(){
        let newMatch = Match(context: manager.context)
        newMatch.opponent = simpleOpponent
        newMatch.team = teamName
        newMatch.yourScore = Int16(simpleYourScore) ?? 0
        newMatch.oppScore = Int16(simpleOpponentScore) ?? 0
        newMatch.date = simpleDate
        newMatch.matchTime = timeFormatted(timeElapsed)
        saveMatchs()
        clearMatchData()
        resetTimer()
    }
    
    //MARK: get data
    func getMatchs(){
        let request = NSFetchRequest<Match>(entityName: "Match")
        do{
            matchs = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching data from CoreData: \(error)")
        }
    }
    
    //MARK: Save data
    func saveMatchs(){
        matchs.removeAll()
        manager.save()
        getMatchs()
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
        timerStatus = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            timeElapsed += 0.1
        }
    }
    
    func pauseTimer() {
        timerStatus = .paused
        timer?.invalidate()
        timer = nil
    }
    
    func stopTimer() {
        timerStatus = .stopped
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        timerStatus = .ready
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
