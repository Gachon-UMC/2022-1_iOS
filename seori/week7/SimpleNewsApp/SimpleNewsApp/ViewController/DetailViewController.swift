//
//  DetailViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/02.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var isLiked = false {
        // isLiked 상태에 따라 버튼 이미지 초기화.
        didSet {
            (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    // 몇 번째 셀의 신문인지를 담을 변수 생성.
    var articleIndex = 0
    var cell = CustomTableViewCell()
    
    // Closure를 통해 버튼 눌렀을 때의 액션을 구현하기 위함.
    var updateLikedButton: ((Bool, UIButton)->()) = { _,_  in }
    
    // MARK: - Subviews
    
    let articleTitleLabel = UILabel()
    let articleImageView = UIImageView()
    let articleContentLabel = UILabel()
    let likedButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 속성 설정.
        setupAttributes()
        // 레이아웃 설정.
        setupLayout()
        // target 설정.
        setupTargets()
        
        print("Article index : \(articleIndex)")
    }
    
    // MARK: - Functions
    
    // 속성 설정.
    func setupAttributes() {
        /* articleTitleLabel attr */
        articleTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        articleTitleLabel.numberOfLines = 0
        
        /* articleImageView attr */
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        articleImageView.layer.cornerRadius = 6
        
        /* articleContentLabel attr */
        articleContentLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        articleContentLabel.numberOfLines = 0
        
        /* Nav attr */
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Detail"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: likedButton)
    }
    
    // 레이아웃 설정.
    func setupLayout() {
        [
            articleTitleLabel,
            articleImageView,
            articleContentLabel
        ].forEach { view.addSubview($0) }
        
        /* articleTitleLabel */
        articleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.left.right.equalToSuperview().inset(16)        }
        
        /* articleImageView */
        articleImageView.snp.makeConstraints { make in
            make.top.equalTo(articleTitleLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.height / 4.5)
        }
        
        /* articleContentLabel */
        articleContentLabel.snp.makeConstraints { make in
            make.top.equalTo(articleImageView.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    // target 설정.
    func setupTargets() {
        // 버튼에 액션 연결.
        likedButton.addTarget(self, action: #selector(tappedLikedButton), for: .touchUpInside)
    }
    
    // TODO: 중복 코드인데 이걸 CustomTableViewCell의 tappedLikedButton()과 연결할 수는 없나?
    // -> 클로저 사용으로 해결!
    // 버튼이 눌릴 때마다 이미지를 변경.
    @objc func tappedLikedButton(_ sender: UIButton) {
        isLiked = !isLiked
        updateLikedButton(isLiked, sender)
    }
    
    // Navigation Back Button 눌렀을 때 실행될 동작 설정.
    override func didMove(toParent parent: UIViewController?) {
        if (!(parent?.isEqual(self.parent) ?? false)) {
            print("In detailVC : articleIndex \(articleIndex)")
            print("In detailVC : isLiked \(isLiked)")
            print("In detailVC : cell.isLiked \(cell.isLiked)")
            
            cell.isLiked = isLiked
        }
    }
}
