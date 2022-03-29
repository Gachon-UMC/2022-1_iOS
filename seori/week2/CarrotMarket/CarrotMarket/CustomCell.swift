//
//  CustomCell.swift
//  CarrotMarket
//
//  Created by 서은수 on 2022/03/29.
//

import UIKit

class CustomCell: UITableViewCell {
    // stackview로 불러와서 tag로 명시하는 방법 고민해보기
    @IBOutlet weak var usedItemImage: UIImageView!
    
    @IBOutlet weak var usedItemTitle: UILabel!
    @IBOutlet weak var usedItemSubdescription: UILabel!
    @IBOutlet weak var usedItemPrice: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var isPushed = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // 하트 눌렀을 때 색깔 바뀌는 액션 구현.
    @IBAction func tappedHeartBtn(_ sender: Any) {
        isPushed = !isPushed
        heartButton.setImage(isPushed ? UIImage(named: "heartFill") : UIImage(named: "heart"), for: .normal)
    }
}
