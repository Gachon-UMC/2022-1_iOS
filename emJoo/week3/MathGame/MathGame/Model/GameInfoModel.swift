//
//  GameInfoModel.swift
//  MathGame
//
//  Created by 이해주 on 2022/04/07.
//

import Foundation

class GameModel {
    let levelIndicator: [GameLevelIndicator] = [
        GameLevelIndicator(id: 0, emoji: "🙂 매우 쉬움", example: "3 + 4 = ?"),
        GameLevelIndicator(id: 0, emoji: "😎 쉬움", example: "14 + 2 = ?"),
        GameLevelIndicator(id: 0, emoji: "🙂 보통", example: "23 + 17 = ?"),
        GameLevelIndicator(id: 0, emoji: "😕 어려움", example: "43 + 23 + 34 = ?"),
        GameLevelIndicator(id: 0, emoji: "😱 매우 어려움", example: "(72X6) + 32 = ?")
    ]
    
    struct GameLevelIndicator : Identifiable {
        let id: Int
        var emoji: String
        var example: String
    }
    
}
