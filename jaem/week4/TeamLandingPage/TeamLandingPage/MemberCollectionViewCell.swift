//
//  MemberCollectionViewCell.swift
//  TeamLandingPage
//
//  Created by 송재민 on 2022/04/12.
//

import UIKit

class MemberCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var memberImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var memberNameLabel: UILabel!
    
    var member: Member! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let member = member{
            memberImageView.image = member.memberImg
            memberNameLabel.text = member.name
            backgroundColorView.backgroundColor = member.color
        } else {
            memberImageView.image = nil
            memberNameLabel.text = nil
            backgroundColorView.backgroundColor = nil
        }
        
        backgroundColorView.layer.cornerRadius = 12
        backgroundColorView.layer.masksToBounds = true
    }
}
