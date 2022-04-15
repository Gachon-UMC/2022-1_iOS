//
//  FeedTableViewCell.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/15.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    // heart 버튼이 눌렸을 때 isSelected 값 변경.
    @IBAction func actionIsHeart(_ sender: UIButton) {
        buttonIsHeart.isSelected = buttonIsHeart.isSelected ? false : true
    }
    
    // BookMark 버튼이 눌렸을 때 isSelected 값 변경.
    @IBAction func actionIsBookMark(_ sender: UIButton) {
        buttonIsBookMark.isSelected = buttonIsBookMark.isSelected ? false : true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewUserProfile.layer.cornerRadius = 12.5  // 너비인 25의 절반 -> 원 모양 만드려고.
        imageViewUserProfile.clipsToBounds = true  // 모서리 잘릴 때 이미지도 같이 잘려야 하기 때문에.
        imageViewMyProfile.layer.cornerRadius = 12.5  // 너비인 25의 절반 -> 원 모양 만드려고.
        imageViewMyProfile.clipsToBounds = true  // 모서리 잘릴 때 이미지도 같이 잘려야 하기 때문에.
        
        // user name만 bold체 처리하기 위해.
        let attrString = NSMutableAttributedString(string: labelFeed.text ?? "")
        attrString.addAttributes([.font: UIFont.boldSystemFont(ofSize: 11)], range: NSRange.init(location: 0, length: labelUserName.text?.count ?? 0))
        labelFeed.attributedText = attrString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
