//
//  Event.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

class Event {
    var sport: String
    var gender: String
    var result: String
    var score: String
    var opponent: String
    var location: String
    var time: String
    var date: String
    var unixTime: Int
    var category: [String]
    
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
