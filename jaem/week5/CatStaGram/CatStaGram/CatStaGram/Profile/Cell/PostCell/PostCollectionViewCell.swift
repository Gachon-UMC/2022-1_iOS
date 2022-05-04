//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/01.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(){
        //이미지 뷰의 이미지를 업로드한다.
    }
}
