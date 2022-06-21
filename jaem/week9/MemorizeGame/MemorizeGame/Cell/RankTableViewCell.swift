//
//  RankTableViewCell.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import UIKit

class RankTableViewCell: UITableViewCell{
    
    @IBOutlet weak var rankNumLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
