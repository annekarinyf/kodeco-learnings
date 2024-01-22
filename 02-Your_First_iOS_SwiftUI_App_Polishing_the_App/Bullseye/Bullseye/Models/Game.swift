//
//  Game.swift
//  Bullseye
//
//  Created by Anne Freitas on 26/09/23.
//

import Foundation

struct Game {
    private struct Constants {
        static let minTargetValue = 1
        static let maxTargetValue = 100
    }
    
    var target = Int.random(in: Constants.minTargetValue...Constants.maxTargetValue)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        return Constants.maxTargetValue - abs(target - sliderValue)
    }
    
    mutating func startNewRound(points: Int) {
        self.score += points
        self.round += 1
    }
}
