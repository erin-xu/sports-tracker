//
//  Filter.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

class Filter : Equatable{
    var name: String
    var isSelected: Bool
    
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return lhs.name == rhs.name
    }

    init (name: String) {
        self.name = name
        self.isSelected = false
    }
}
