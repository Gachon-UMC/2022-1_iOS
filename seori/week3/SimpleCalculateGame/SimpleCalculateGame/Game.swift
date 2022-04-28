//
//  Game.swift
//  SimpleCalculateGame
//
//  Created by 서은수 on 2022/04/07.
//

import Foundation

// 게임 한 판에 필요한 속성들을 정의.
struct Game {
    var level: Int
    var questionNum: Int
    var question: [String]
    var answer: [String]
    var currentStage: Int
}
