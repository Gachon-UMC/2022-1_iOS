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
    lazy var isLiked = false
    var articleToDisplay: Article?
    
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
        
        // isLiked 상태에 따라 버튼 이미지 초기화.
        (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        // 버튼에 액션 연결.
        likedButton.addTarget(self, action: #selector(tappedLikedButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    // cell의 내용을 기사의 제목, 내용, 사진으로 구성해 주는 함수. -> cellForRowAt에서 호출됨.
    func displayArticle(article: Article){
        articleToDisplay = article
        
        titleLabel.text = articleToDisplay!.title
        contentLabel.text = articleToDisplay?.content
        
        // 이미지 url이 없는 기사가 있을 수 있다. image url이 없다면 여기서 함수를 종료시킨다.
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                // image를 변경하는 작업은 UI를 변경시키는 작업이므로 main thread에서 돌려주어야 한다.
                DispatchQueue.main.async {
                    self.articleImage.image = UIImage(data: data!)
                }
            }
        }
        
        dataTask.resume()
    }

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
