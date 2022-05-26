//
//  FeedTableViewCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/09.
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
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // imageView custom
    imageViewUserProfile.layer.cornerRadius = 12.5
    imageViewUserProfile.clipsToBounds = true // 이미지도 같이 깎이기 위함
    imageViewMyProfile.layer.cornerRadius = 12.5
    imageViewMyProfile.clipsToBounds = true
    
    // textField custom
    let fontSize = UIFont.boldSystemFont(ofSize: 9)
    let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
    attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 7))
    labelFeed.attributedText = attributedStr
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction func actionIsHeart(_ sender: UIButton) {
    if buttonIsHeart.isSelected {
      buttonIsHeart.isSelected = false
    } else {
      buttonIsHeart.isSelected = true
    }
  }
  @IBAction func actionIsBookMark(_ sender: UIButton) {
    if buttonIsBookMark.isSelected {
      buttonIsBookMark.isSelected = false
    } else {
      buttonIsBookMark.isSelected = true
    }
  }
}
