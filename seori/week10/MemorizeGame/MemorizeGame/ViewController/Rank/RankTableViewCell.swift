//
//  RankTableViewCell.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/27.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "RankCell"
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
