//
//  GameCollectionViewCell.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var frontView: UIView!
  @IBOutlet weak var emojiLabel: UILabel!
  @IBOutlet weak var backView: UIView!
  
  var isFlipped = false
  var isCorrect = false
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.layer.cornerRadius = 10
    
    self.frontView.isHidden = true
  }
  
  func flip() {
    UIView.transition(with: self.contentView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
      if self.isFlipped {
        self.frontView.isHidden = true
        self.backView.isHidden = false
      } else {
        self.backView.isHidden = true
        self.frontView.isHidden = false
      }
      self.isFlipped = !self.isFlipped
    }, completion: nil)
  }
  
}
