//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/27.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
  static let identifier = "PostCollectionViewCell"
  
  @IBOutlet weak var postImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  public func setupData(_ imageURLStr: String?) {
    guard let imageURLStr = imageURLStr else { return }
    if let url = URL(string: imageURLStr) {
      postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
    }
  }
  
}
