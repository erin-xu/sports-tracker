//
//  Event.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

struct Event : Codable{
    let sport: String
    let gender: String
    let result: String
    let score: String
    let opponent: String
    let location: String
    let time: String
    let date: String
    let unixTime: Int
    let category: [String]
    
    init (sport: String, gender: String, result: String, score: String, opponent: String, location: String, time: String, date: String, unixTime: Int) {
        self.sport = sport
        self.gender = gender
        self.result = result
        self.score = score
        self.opponent = opponent
        self.location = location
        self.time = time
        self.date = date
        self.unixTime = unixTime
        self.category = [gender, sport]
    }
}
