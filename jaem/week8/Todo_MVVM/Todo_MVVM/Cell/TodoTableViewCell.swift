//
//  TodoTableViewCell.swift
//  Todo_MVVM
//
//  Created by 송재민 on 2022/05/18.
//
import UIKit

class TodoTableViewCell: UITableViewCell{
    
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
