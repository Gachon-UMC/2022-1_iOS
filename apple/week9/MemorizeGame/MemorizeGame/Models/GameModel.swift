//
//  gameModel.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

import Foundation

struct GameModel {
  var cards: [Card] = [
    Card(category: "Vehicle", emogis: ["🏎", "🚐", "🚀", "🚔", "⛵️", "🚋"]),
    Card(category: "Face", emogis: ["😀", "☺️", "😆", "🥹", "🙃", "😱"]),
    Card(category: "Animal", emogis: ["🐶", "🐷", "🙊", "🐯", "🐨", "🦊"]),
    Card(category: "Fruite", emogis: ["🍓", "🍎", "🍊", "🍒", "🍑", "🍈"])
  ]
  var isSuffled = false
  
  mutating func initCards() {
    if isSuffled == false {
      for i in 0...self.cards.count - 1 {
        self.cards[i].emogis.append(contentsOf: self.cards[i].emogis)
        self.cards[i].emogis = self.cards[i].emogis.shuffled()
        self.isSuffled = true
        print(self.cards[i].emogis)
      }
    }
  }
  
  func getCard(index: Int) -> Card {
    return self.cards[index]
  }
  
  func getCategoryString() -> [String] {
    var categoryStrings: [String] = []
    
    for card in self.cards {
      var string = card.category + " "
      for emogi in card.emogis {
        string = string + emogi + " "
      }
      categoryStrings.append(string)
    }
    
    return categoryStrings
  }
  
  struct Card {
    let category: String
    var emogis: [String]
  }
}
