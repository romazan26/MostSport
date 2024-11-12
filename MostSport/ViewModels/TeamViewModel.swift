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
    
    @Published var players: [Player] = []
    init(){
        loadTeamName()
        getData()
    }
    
    //MARK: - Get data
    func getData() {
        let request = NSFetchRequest<Player>(entityName: "Player")
        do{
            players = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
    }
    
    //MARK: - Load team name function
    func loadTeamName() {
       if let savedUserData = UserDefaults.standard.data(forKey: "user"),
          let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
           teamName = decodedUser.team
       }
   }
}
