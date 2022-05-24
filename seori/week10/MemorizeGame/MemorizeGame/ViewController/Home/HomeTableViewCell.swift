//
//  HomeTableViewCell.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "HomeCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
