//
//  FavoriteViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/03.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    
    let model = ArticleModel()
    lazy var articles = [Article]()
    lazy var favoriteArticles = [Article]()
    
    // MARK: - Subviews
    
    let tableView = UITableView()
    let deleteAllButton = UIButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupAttributes()
        setupTableView()
        
        // article 설정.
        model.delegate = self
        model.getArticles()
    }
    
    func setupAttributes() {
        /* deleteAllButton attr */
        deleteAllButton.setTitle("Delete All", for: .normal)
        deleteAllButton.configuration = .plain() // -> 이걸 쓰지 않으면 rightBarButtonItem으로 뜨지 않는다!
        // 버튼을 이미지로 설정해 뒀던 ellipsisButton은 안 써줘도 잘 됐으나, 이건 text로 이루어진 버튼이라 뭐가 다른가 보다.
        
        /* Nav attr */
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Favorites"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: deleteAllButton)
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - ArticleModelProtocol
extension FavoriteViewController: ArticleModelProtocol {
    
    func articlesRetrieved(articles: [Article]) {
        print("FavVC : Get returned articles data from ArticleModel")
        self.articles = articles    // 받아온 데이터를 ViewController에 저장.
        
        // articles 데이터를 받아온 이후에 테이블뷰를 다시 업데이트 해야 한다.
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }
        
        cell.displayArticle(article: favoriteArticles[indexPath.row])
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
