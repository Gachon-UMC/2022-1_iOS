//
//  GameInfoModel.swift
//  MathGame
//
//  Created by 이해주 on 2022/04/07.
//

import Foundation

class GameModel {
    let levelIndicator: [GameLevelIndicator] = [
        GameLevelIndicator(emoji: "🙂 매우 쉬움", example: "3 + 4 = ?"),
        GameLevelIndicator(emoji: "😎 쉬움", example: "14 + 2 = ?"),
        GameLevelIndicator(emoji: "🙂 보통", example: "23 + 17 = ?"),
        GameLevelIndicator(emoji: "😕 어려움", example: "43 + 23 + 34 = ?"),
        GameLevelIndicator(emoji: "😱 매우 어려움", example: "(72X6) + 32 = ?")
    ]
    
    struct GameLevelIndicator  {
        var emoji: String
        var example: String
    }
    
}
