//
//  GameCollectionViewCell.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/06/05.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var picLabel: UILabel!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    func flipUp(speed: TimeInterval = 0.3){
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options:[.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        
        picLabel.alpha = 1
    }
    
    func flipDown(speed: TimeInterval = 0.3, delay: TimeInterval = 0.5){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            // flip down animation
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
            
            self.picLabel.alpha = 0
        }
    }
    
    func showFront(){
        picLabel.alpha = 1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
