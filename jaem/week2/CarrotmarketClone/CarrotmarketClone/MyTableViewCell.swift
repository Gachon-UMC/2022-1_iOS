//
//  MyTableViewCell.swift
//  CarrotmarketClone
//
//  Created by 송재민 on 2022/03/29.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemSubDes: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemLike: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
