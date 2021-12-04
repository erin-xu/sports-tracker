//
//  Event.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

struct EventResponse: Codable {
    var events: [Event]
}

struct Event : Codable{
    let id: Int
    let title: String
    let description: String
    let team : EventTeam
    let sport: String
    let gender: String
    let win: String
    let score: String
    let opponent: String
    let location: String
    let time: String
    let date: String
    let unixTime: Int
    
    init (sport: String, gender: String, win: String, score: String, opponent: String, location: String, time: String, date: String, unixTime: Int, id: Int, title: String, description: String, team: EventTeam) {
        self.sport = sport
        self.gender = gender
        self.win = win
        self.score = score
        self.opponent = opponent
        self.location = location
        self.time = time
        self.date = date
        self.unixTime = unixTime
        self.id = id
        self.title = title
        self.description = description
        self.team = team
    }
    
    init() {
        self.sport = ""
        self.gender = ""
        self.win = ""
        self.score = ""
        self.opponent = ""
        self.location = ""
        self.time = ""
        self.date = ""
        self.unixTime = 0
        self.id = 0
        self.title = ""
        self.description = ""
        self.team = EventTeam()
    }
}

struct TeamEvent : Codable{
    let id: Int
    let title: String
    let sport: String
    let gender: String
    let win: String
    let score: String
    let opponent: String
    let location: String
    let time: String
    let date: String
    let unixTime: Int
    
    init (sport: String, gender: String, win: String, score: String, opponent: String, location: String, time: String, date: String, unixTime: Int, id: Int, title: String) {
        self.sport = sport
        self.gender = gender
        self.win = win
        self.score = score
        self.opponent = opponent
        self.location = location
        self.time = time
        self.date = date
        self.unixTime = unixTime
        self.id = id
        self.title = title
    }
}
