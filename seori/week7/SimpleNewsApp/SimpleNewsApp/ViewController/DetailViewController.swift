//
//  DetailViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var isLiked = false
    
    // MARK: - Subviews
    
    let articleTitle = Subviews().articleTitle
    let articleImage = Subviews().articleImage
    let articleContent = Subviews().articleContent
    let likedButton = Subviews().likedButton
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 설정.
        setupNav()
        
        // isLiked 상태에 따라 버튼 이미지 초기화.
        (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        // 버튼에 액션 연결.
        likedButton.addTarget(self, action: #selector(tappedLikedButton), for: .touchUpInside)
    
    }

    override func viewDidLayoutSubviews() {
        view.addSubview(articleTitle)
        view.addSubview(articleImage)
        view.addSubview(articleContent)
        
        NSLayoutConstraint.activate([
            articleTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            articleTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            articleTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            articleImage.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 15),
            articleImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            articleImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            articleImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.5),
            
            articleContent.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: 25),
            articleContent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            articleContent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    // MARK: - Functions
    
    // 네비게이션 설정.
    func setupNav() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Detail"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: likedButton)
    }
    
    // TODO: 중복 코드인데 이걸 CustomTableViewCell의 tappedLikedButton()과 연결할 수는 없나?
    // 버튼이 눌릴 때마다 이미지를 변경.
    @objc func tappedLikedButton() {
        isLiked = !isLiked
        (isLiked) ? likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
