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
        let bonusPoint = bonusPoint(difference: difference)
        return Constants.maxTargetValue - difference + bonusPoint
    }
    
    func bonusPoint(difference: Int) -> Int {
        switch difference {
        case 0:
            return 100
        case let x where x <= 2:
            return 50
        default:
            return 0
        }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: Constants.minTargetValue...Constants.maxTargetValue)
    }
}
