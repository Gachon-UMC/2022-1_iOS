//
//  CarouselCell.swift
//  iOSTeamLandingPage
//
//  Created by 서은수 on 2022/04/13.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberNickName: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    var teamMembers: TeamMembers! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let teamMembers = teamMembers {
            memberImage.image = UIImage(named: teamMembers.imagePath)
            memberNickName.text = teamMembers.nickName
        } else {
            memberImage.image = nil
            memberNickName.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10
        backgroundColorView.layer.masksToBounds = true
        memberImage.layer.cornerRadius = 10
        memberImage.layer.masksToBounds = true
    }
}
