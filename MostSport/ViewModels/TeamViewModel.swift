//
//  TeamViewModel.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import Foundation
import CoreData

final class TeamViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var teamName = ""
    
    @Published var sortingType = false
    @Published var isPresetnAddPlayerView = false
    @Published var isArchiveMode = false
    @Published var isEditMode = false
    
    @Published var players: [Player] = []
    @Published var noArchivePlayers: [Player] = []
    @Published var archivePlayers: [Player] = []
    @Published var simplePlayers: [Player] = []
    
    init(){
        loadTeamName()
        getData()
        sortedPlayers()
    }
    
    @Published var selectedPlayer: Player?
    @Published var simpleName = ""
    @Published var simpleNumber = ""
    @Published var simplePosition = ""
    @Published var simpleGoals = ""
    @Published var simpleAssists = ""
    @Published var simpleYellowCards = ""
    @Published var simpleRedCards = ""
    
    //MARK: - get data for dashboard
    func getGoalsCount() -> String{
        var  goalsCount: Int = 0
        for player in players{
            goalsCount += Int(player.goals)
        }
        return String(goalsCount)
    }
    
    func getPenaltiesCount() -> String{
        var penaltiesCount: Int = 0
        for player in players{
            penaltiesCount += Int(player.redCards) + Int(player.yellowCard)
        }
        return String(penaltiesCount)
    }
    
    //MARK: - Feel data
    func feelData(player: Player){
        simpleName = player.playerName ?? ""
        simpleNumber = String(player.number)
        simplePosition = player.position ?? ""
        simpleGoals = String(player.goals)
        simpleAssists = String(player.assists)
        simpleYellowCards = String(player.yellowCard)
        simpleRedCards = String(player.redCards)
    }
    
    //MARK: - Edit data
    func editPlayer(){
        let request = NSFetchRequest<Player>(entityName: "Player")
        do{
            players = try manager.context.fetch(request)
            let editPlayer = players.first(where: { $0.id == selectedPlayer?.id })
            editPlayer?.playerName = simpleName
            editPlayer?.number = Int16(simpleNumber) ?? 0
            editPlayer?.position = simplePosition
            editPlayer?.goals = Int16(simpleGoals) ?? 0
            editPlayer?.assists = Int16(simpleAssists) ?? 0
            editPlayer?.yellowCard = Int16(simpleYellowCards) ?? 0
            editPlayer?.redCards = Int16(simpleRedCards) ?? 0
        }catch let error{
            print("Error: \(error)")
        }
        savePlayers()
        isPresetnAddPlayerView = false
        isEditMode = false
        clearSimpleData()
    }
    
    //MARK: - Add player
    func addPlayer(){
        let newPlayer = Player(context: manager.context)
        
        newPlayer.playerName = simpleName
        newPlayer.number = Int16(simpleNumber) ?? 0
        newPlayer.position = simplePosition
        newPlayer.goals = Int16(simpleGoals) ?? 0
        newPlayer.assists = Int16(simpleAssists) ?? 0
        newPlayer.yellowCard = Int16(simpleYellowCards) ?? 0
        newPlayer.redCards = Int16(simpleRedCards) ?? 0
        
        manager.save()
        clearSimpleData()
    }
    
    //MARK: - Clear simple data
    func clearSimpleData(){
        simpleName = ""
        simpleNumber = ""
        simplePosition = ""
        simpleGoals = ""
        simpleAssists = ""
        simpleYellowCards = ""
        simpleRedCards = ""
    }
    
    //MARK: - Delete player
    func deletePlayer(_ player: Player) {
        manager.context.delete(player)
        savePlayers()
    }
    
    //MARK: - Save edit for archive
    func saveRemoveForArchive() {
        for simplePlayer in simplePlayers {
            for player in players {
                if simplePlayer.id == player.id {
                    player.isArchive = false
                }
            }
        }
        savePlayers()
        simplePlayers.removeAll()
    }
    
    func saveAddingForArchive() {
        for simplePlayer in simplePlayers {
            for player in players {
                if simplePlayer.id == player.id {
                    player.isArchive = true
                }
            }
        }
        savePlayers()
        simplePlayers.removeAll()
        isArchiveMode = false
    }
    
    //MARK: - Get sorted players
    func sortedPlayers() {
        noArchivePlayers.removeAll()
        archivePlayers.removeAll()
        for player in players {
            if player.isArchive {
                archivePlayers.append(player)
            } else {
                noArchivePlayers.append(player)
            }
        }
    }
    
    func addSimplePlayer(_ player: Player) {
        if simplePlayers.contains(player) {
            simplePlayers.removeAll(where: { $0.id == player.id })
        }else {
            simplePlayers.append(player)
        }
    }
    
    func cheackContains(_ player: Player) -> Bool {
        return simplePlayers.contains(player)
    }
    
    //MARK: - Get data
    func getData() {
        let request = NSFetchRequest<Player>(entityName: "Player")
        do{
            players = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
        sortedPlayers()
    }
    
    //MARK: - Load team name function
    func loadTeamName() {
        if let savedUserData = UserDefaults.standard.data(forKey: "user"),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            teamName = decodedUser.team
        }
    }
    
    //MARK: - Save data
    func savePlayers() {
        players.removeAll()
        manager.save()
        getData()
        sortedPlayers()
    }
}
