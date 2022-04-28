//
//  ProfileCollectionViewCell.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/28.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profilePlusImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var followerCountingLabel: UILabel!
    @IBOutlet weak var followingCountingLabel: UILabel!
    
    // Nib 파일이 실행될 때 실행되는 함수.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpAttribute()
    }

    private func setUpAttribute() {
        // imageView를 둥글게.
        profileImageView.cornerRadius = profileImageView.frame.width / 2
        profilePlusImageView.cornerRadius =  profilePlusImageView.frame.width / 2
        
        // button 모서리를 둥글게.
        editButton.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.cornerRadius = 5
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        // 게시물, 팔로워, 팔로잉 수 랜덤 생성.
        [postingCountLabel, followerCountingLabel, followingCountingLabel].forEach({
            $0?.text = "\(Int.random(in: 0...10))"  // 0 이상이면서 10 이하의 랜덤 수 생성.
        })
    }
}
