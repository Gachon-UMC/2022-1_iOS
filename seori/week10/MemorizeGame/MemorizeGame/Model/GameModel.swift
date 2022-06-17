//
//  GameModel.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/24.
//

import Foundation

class GameModel {
    
    // MARK: - Properties
    
    /* 게임 카테고리를 담은 배열 */
    private var categories = [
        "Vehicle 🏎 🚌 🚐 🛴 🛵 🚗",
        "Face 😃 😇 🤗 🤑 😋 😙",
        "Animal 🐷 🐰 🐨 🦁 🙊 🐱",
        "Fruit 🍇 🍈 🍉 🍒 🍌 🥝"
    ]
    
    /* 각 카테고리마다 필요한 게임 데이터셋을 담은 배열 */
    /// shuffled() 함수를 이용해 내용을 섞어 준다.
    private var gameDataSet = [
        ["🏎", "🏎", "🚌", "🚌", "🚐", "🚐", "🛴", "🛴", "🛵", "🛵", "🚗", "🚗"].shuffled(),
        ["😃", "😃", "😇", "😇", "🤗", "🤗", "🤑", "🤑", "😋", "😋", "😙", "😙"].shuffled(),
        ["🐷", "🐷", "🐰", "🐰", "🐨", "🐨", "🦁", "🦁", "🙊", "🙊", "🐱", "🐱"].shuffled(),
        ["🍇", "🍇", "🍈", "🍈", "🍉", "🍉", "🍒", "🍒", "🍌", "🍌", "🥝", "🥝"].shuffled()
    ]
    
    // MARK: - Value Object
    
    /* VO. 게임 카드 정보에 대한 구조체 */
    public struct Card {
        var data: String!
        var isRight: Bool! = false
    }
    
    private var cards = [Card]()
    
    // MARK: - Functions
    
    /* 게임 카테고리 관련 함수 */
    /// - 게임 카테고리 갯수 반환.
    public func getCategoryCounts() -> Int {
        categories.count
    }
    /// - 해당 게임 카테고리의 이름 반환.
    public func getCategory(_ index: Int) -> String {
        categories[index]
    }
    
    /* 게임 전 로드 함수 */
    /// - 해당 게임 카테고리의 게임 데이터 로드.
    public func loadingGameData(_ categoryIndex: Int) {
        for gameData in gameDataSet[categoryIndex] {
            cards.append(Card(data: gameData))
        }
    }
    
    /* 게임 중 쓰이는 함수 */
    /// - 게임 데이터 중 특정 인덱스에 위치한 카드의 정보를 반환.
    public func getCard(_ cardIndex: Int) -> Card {
        cards[cardIndex]
    }
    /// - 카드의 맞는 쌍을 찾았을 때 isRight 값을 변경.
    public func setRightCard(_ cardIndex: Int) {
        cards[cardIndex].isRight = !cards[cardIndex].isRight
    }
}
