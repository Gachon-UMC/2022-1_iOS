//
//  TeamCollectionViewCell.swift
//  IOSTeamLanding
//
//  Created by 조동진 on 2022/04/12.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var characterView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        
    characterView.layer.cornerRadius = 10
    }

}
