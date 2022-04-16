//
//  PersonCollectionViewCell.swift
//  IOSTeamLanding
//
//  Created by 조동진 on 2022/04/12.
//

import Foundation
import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var name: UILabel!
  
  var person: Person! {
    didSet {
      self.updateUI()
    }
  }
  
  func updateUI() {
    if let person = person {
      imageView.image = person.image
      name.text = person.name
    } else {
      imageView.image = nil
      name.text = nil
    }
    
    name.textColor = .white
    
    imageView.backgroundColor = UIColor.systemGray3
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
  }
}
