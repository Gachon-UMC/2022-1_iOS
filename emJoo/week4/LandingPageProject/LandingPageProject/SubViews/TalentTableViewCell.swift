//
//  TalentTableViewCell.swift
//  LandingPageProject
//
//  Created by 이해주 on 2022/04/11.
//

import UIKit

class TalentTableViewCell: UITableViewCell {
    static let cellId = "talentCell"
    
    let aimLabel: UILabel = {
        let label = UILabel()
        label.text = "aiom"
        label.textColor = .white
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        contentView.addSubview(aimLabel)
    }
    
}
