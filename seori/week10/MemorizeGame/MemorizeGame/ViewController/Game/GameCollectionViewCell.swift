//
//  GameCollectionViewCell.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/24.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCell"
    
    @IBOutlet weak var dataLabel: UILabel!
    
    /// - 게임 시작되고 초기 셀 보이게 하는 메서드.
    public func appearCell() {
        self.backgroundColor = .systemOrange
        self.dataLabel.isHidden = true
        self.isUserInteractionEnabled = true
    }
    
    /// - 카드의 앞면을 구성.
    public func showFront() {
        print("Show Front") // test
        self.dataLabel.isHidden = false
        self.backgroundColor = .white
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.systemOrange.cgColor
        flipCard()
    }
    
    /// - 카드의 뒷면을 구성.
    public func showBack() {
        print("Show Back") // test
        self.dataLabel.isHidden = true
        self.backgroundColor = .systemOrange
        flipCard()
    }
    
    /// - Card Flip Animation.
    private func flipCard() {
        UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}
