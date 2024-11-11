//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var imageUrl: String
    var text: String
    var secondText: String
    var tag: Int

    static var samplePage = PageIntro(imageUrl: "Intro1", text: "Follow the progress of your team", secondText: "Analyze football statistics", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(imageUrl: "Intro1", text: "Follow the progress of your team", secondText: "Analyze football statistics", tag: 0),
        PageIntro(imageUrl: "Intro2", text: "Add players and track their achievements", secondText: "Be aware of what's going on with the players", tag: 1),
    ]
}
