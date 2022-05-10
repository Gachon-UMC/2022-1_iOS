//
//  CustomTableViewCell.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/01.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    // 버튼의 상태를 저장하는 변수 생성.
    lazy var isLiked = false {
        // 값 바뀔 때마다 버튼 이미지 체크.
        didSet {
            (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    var articleToDisplay: Article?
    
    // Closure를 통해 버튼 눌렀을 때의 액션을 구현하기 위함.
    var updateLikedButton: ((Bool, UIButton)->()) = { _,_  in }
    
    // MARK: - Subviews
    
    // cell에 들어갈 서브뷰들 생성.
    let articleTitleLabel = UILabel()
    let articleContentLabel = UILabel()
    let articleImageView = UIImageView()
    let likedButton = UIButton()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 속성 설정.
        setupAttributes()
        // cell의 서브뷰들의 레이아웃 설정.
        setupLayout()
        // target 설정.
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    // cell의 내용을 기사의 제목, 내용, 사진으로 구성해 주는 함수. -> cellForRowAt에서 호출됨.
    func displayArticle(article: Article){
        articleToDisplay = article
        
        articleTitleLabel.text = articleToDisplay!.title
        articleContentLabel.text = articleToDisplay?.description
        
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
                    self.articleImageView.image = UIImage(data: data!)
                }
            }
        }
        
        dataTask.resume()
    }

    // 속성 설정.
    func setupAttributes() {
        /* articleTitleLabel attr */
        articleTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        articleTitleLabel.numberOfLines = 2
        
        /* articleImageView attr */
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        articleImageView.layer.cornerRadius = 6
        
        /* articleContentLabel attr */
        articleContentLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        articleContentLabel.textColor = .darkGray
        articleContentLabel.numberOfLines = 3
        
        /* likedButton attr */
        // isLiked 상태에 따라 버튼 이미지 초기화.
        (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    // cell의 서브뷰들의 레이아웃 설정.
    func setupLayout() {
        [
            articleTitleLabel,
            articleContentLabel,
            articleImageView,
            likedButton
        ].forEach { contentView.addSubview($0) }
        
        /* articleTitleLabel */
        articleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(26)
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(articleImageView.snp.left).offset(-20)
        }
        
        /* articleContentLabel */
        articleContentLabel.snp.makeConstraints { make in
            make.top.equalTo(articleTitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(articleImageView.snp.left).offset(-20)
        }
        
        /* articleImageView */
        articleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(26)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        /* likedButton */
        likedButton.snp.makeConstraints { make in
            make.right.equalTo(articleImageView.snp.right).offset(-11)
            make.bottom.equalTo(articleImageView.snp.bottom).offset(-11)
        }
    }
    
    // target 설정.
    func setupTargets() {
        // 버튼에 액션 연결.
        likedButton.addTarget(self, action: #selector(tappedLikedButton), for: .touchUpInside)
    }
    
    // 버튼이 눌릴 때마다 이미지를 변경.
    @objc func tappedLikedButton(_ sender: UIButton) {
        isLiked = !isLiked
        updateLikedButton(isLiked, sender)
    }
}
