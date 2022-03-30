//
//  MyTableViewCell.swift
//  CarrotmarketClone
//
//  Created by 송재민 on 2022/03/29.
//

import UIKit


class MyTableViewCell: UITableViewCell {
    var likeClickedAction :(()->())?
    
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemSubDes: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemLike: UIImageView!
    @IBOutlet weak var itemLikeBtn: UIButton!
    
    @objc func likeClicked(){
        likeClickedAction?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.itemLikeBtn.addTarget(self, action: #selector(likeClicked), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
