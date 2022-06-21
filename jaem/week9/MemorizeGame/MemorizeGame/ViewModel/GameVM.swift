//
//  GameVM.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/06/05.
//

import Foundation

class GameVM: ObservableObject{
    @Published public var model = GameModel()
    typealias Card = GameModel.Card
    
    func setIsMatched(index: Int){
        model.setIsMatched(index: index)
    }
    
    func setIsFlipped(index: Int){
        model.setIsFlipped(index: index)
    }
    
    func getCardPicture(index: Int) -> String{
        return model.getCardPicture(index: index)
    }
    
    func setCardList(cards: [String]){
        model.setCardList(cards: cards)
    }
    
    func getCardList() -> [Card]{
        return model.getCardList()
    }

}
