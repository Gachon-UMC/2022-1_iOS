//
//  RankTableViewCell.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

import UIKit

class RankTableViewCell: UITableViewCell {
  // MARK: Variables
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var userLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
