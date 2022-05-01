//
//  CustomTableViewCell.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    // 버튼의 상태를 저장하는 변수 생성.
    lazy var isLiked : Bool = false
    
    // MARK: - Subviews
    
    // cell에 들어갈 서브뷰들 생성.
    lazy var titleLabel = Subviews().titleLabel
    lazy var contentLabel = Subviews().contentLabel
    lazy var articleImage = Subviews().articleImage
    lazy var likedButton = Subviews().likedButton
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // cell의 서브뷰들의 레이아웃 설정.
        configureCell()
        
        // 버튼에 액션 연결.
        likedButton.addTarget(self, action: #selector(tappedLikedButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    // cell의 서브뷰들의 레이아웃 설정.
    func configureCell() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(articleImage)
        contentView.addSubview(likedButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: articleImage.leftAnchor, constant: -20),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            contentLabel.rightAnchor.constraint(equalTo: articleImage.leftAnchor, constant: -20),
            
            articleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            articleImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            articleImage.widthAnchor.constraint(equalToConstant: 120),
            articleImage.heightAnchor.constraint(equalToConstant: 120),
            
            likedButton.bottomAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: -11),
            likedButton.rightAnchor.constraint(equalTo: articleImage.rightAnchor, constant: -11)
        ])
    }
    
    // 버튼이 눌릴 때마다 이미지를 변경.
    @objc func tappedLikedButton() {
        isLiked = !isLiked
        (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
