//
//  NewsTableViewCell.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/03.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var newsImage: UIImageView!
  @IBOutlet weak var heartButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
