//
//  TodoTableViewCell.swift
//  TodoApp_MVVM
//
//  Created by 서은수 on 2022/05/19.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    static let cellID = "cell"
    
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
