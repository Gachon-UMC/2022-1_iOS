//
//  GameModel.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/06/05.
//

import Foundation

struct GameModel{
    
    var cardList: [Card] = []
    
    mutating func setIsMatched(index: Int){
        cardList[index].isMatched = true
    }
    
    mutating func setIsFlipped(index: Int){
        cardList[index].isFlipped = !cardList[index].isFlipped
    }
    
    func getCardPicture(index: Int) -> String{
        return cardList[index].cardPicture
    }
    
    mutating func setCardList(cards: [String]){
        for card in cards{
            cardList.append(Card(cardPicture: card, isMatched: false, isFlipped: false))
        }
    }
    
    func getCardList() -> [Card]{
        return cardList
    }
    
    struct Card{
        var cardPicture: String = ""
        var isMatched: Bool = false
        var isFlipped: Bool = false
    }
}
