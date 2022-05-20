//
//  TodoTableViewCell.swift
//  Todo
//
//  Created by 조동진 on 2022/05/16.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

  @IBOutlet weak var contentLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
