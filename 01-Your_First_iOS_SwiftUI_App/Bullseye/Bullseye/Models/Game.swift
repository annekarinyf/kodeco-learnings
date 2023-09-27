//
//  Game.swift
//  Bullseye
//
//  Created by Anne Freitas on 26/09/23.
//

import Foundation

struct Game {
  private struct Contants {
    static let minTargetValue: Int = 1
    static let maxTargetValue: Int = 100
  }
  
  var target: Int = Int.random(in: Contants.minTargetValue...Contants.maxTargetValue)
  var score: Int = 0
  var round: Int = 1
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let points = Contants.maxTargetValue - difference
    
    return points
  }
}
