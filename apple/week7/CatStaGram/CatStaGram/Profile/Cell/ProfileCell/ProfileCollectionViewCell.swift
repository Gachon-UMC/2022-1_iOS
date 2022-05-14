//
//  ProfileCollectionViewCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/27.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var addProfileImageView: UIImageView!
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var addFriendButton: UIButton!
  @IBOutlet weak var postingCountLabel: UILabel!
  @IBOutlet weak var followerCountLabel: UILabel!
  @IBOutlet weak var followingCountLabel: UILabel!
  
  
  static let identifier = "ProfileCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupAttribute()
  }
  
  private func setupAttribute() {
    profileImageView.layer.cornerRadius = 88 / 2
    addProfileImageView.layer.cornerRadius = 24 / 2
    
    editButton.layer.cornerRadius = 5
    editButton.layer.borderColor = UIColor.lightGray.cgColor
    editButton.layer.borderWidth = 1
    
    addFriendButton.layer.cornerRadius = 5
    addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
    addFriendButton.layer.borderWidth = 1
    
    profileImageView.layer.borderColor = UIColor.darkGray.cgColor
    profileImageView.layer.borderWidth = 1
    
    [postingCountLabel, followerCountLabel, followingCountLabel].forEach { $0?.text = "\(Int.random(in: 0...10))" }
  }
}
