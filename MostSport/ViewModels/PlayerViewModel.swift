//
//  PlayerViewModel.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import Foundation
import CoreData

final class PlayerViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var simpleName = ""
    @Published var simpleNumber = ""
    @Published var simplePosition = ""
    @Published var simpleGoals = ""
    @Published var simpleAssists = ""
    @Published var simpleYellowCards = ""
    @Published var simpleRedCards = ""
    
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
}
