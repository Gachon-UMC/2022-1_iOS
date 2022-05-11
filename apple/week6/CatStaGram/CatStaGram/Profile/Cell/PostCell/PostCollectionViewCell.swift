//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/27.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
  static let identifier = "PostCollectionViewCell"
  
  @IBOutlet weak var postImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  public func setupData() {
    // imageView upload
  }
}
