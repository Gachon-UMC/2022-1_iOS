//
//  gameViewModel.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/27.
//

import Foundation

class GameViewModel:ObservableObject {
  @Published public var model = GameModel()
  typealias Card = GameModel.Card
  
  func initCards() {
    model.initCards()
  }
  
  func getCard(index: Int) -> Card {
    return model.getCard(index: index)
  }
  
  func getCategoryString() -> [String] {
    return model.getCategoryString()
  }
}
