//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/28.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    // 인스턴스 생성 없이 바로 접근 가능하도록 하기 위해 static으로 생성.
    static let identifier = "PostCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setUpData(_ imageURLString: String?) {
        // 이미지뷰의 이미지를 업로드한다.
        
        // Optional 해제.
        guard let imageURLStr = imageURLString else { return }
        
        if let url = URL(string: imageURLStr) {
            postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
        
    }
}
