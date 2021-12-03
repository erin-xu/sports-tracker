//
//  Team.swift
//  score!
//
//  Created by Jennifer Gu on 12/3/21.
//

import Foundation

struct TeamResponse: Codable {
    var teams: [Team]
}

struct Team: Codable {
    let id: Int
    let name: String
    let gender: String
    let sport: String
    let events: [Event]
    
    init(id: Int, name: String, gender: String, sport: String, events: [Event]) {
        self.id = id
        self.name = name
        self.gender = gender
        self.sport = sport
        self.events = events
    }
}
