//
//  Game.swift
//  Bullseye
//
//  Created by Anne Freitas on 26/09/23.
//

import Foundation

struct Game {
  private struct Contants {
    static let minTargetValue = 1
    static let maxTargetValue = 100
  }
  
  var target = Int.random(in: Contants.minTargetValue...Contants.maxTargetValue)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let points = Contants.maxTargetValue - difference
    
    return points
  }
}
