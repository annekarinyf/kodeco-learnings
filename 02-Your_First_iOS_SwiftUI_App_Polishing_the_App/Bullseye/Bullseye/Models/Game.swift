//
//  Game.swift
//  Bullseye
//
//  Created by Anne Freitas on 26/09/23.
//

import Foundation

struct Game {
    private struct Constants {
        struct Target {
            static let min = 1
            static let max = 100
        }
    }
    
    var target = Int.random(in: Constants.Target.min...Constants.Target.max)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonusPoint = bonusPoint(difference: difference)
        return Constants.Target.max - difference + bonusPoint
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
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: Constants.Target.min...Constants.Target.max)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: Constants.Target.min...Constants.Target.max)
    }
    
    private mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
