//
//  UsedItemCell.swift
//  KarrotMarket
//
//  Created by 조동진 on 2022/03/28.
//

import UIKit

class UsedItemCell: UITableViewCell {
  
  @IBOutlet weak var itemImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subDescriptionLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var heartButton: UIButton!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
