//
//  ViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let articles = ArticleModel.articles
    
    // MARK: - Subviews
    
    let ellipsisButton = Subviews().ellipsisButton
    let tableView = Subviews().tableView
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar 설정.
        setupNav()
        
        // tableView의 delegate 설정.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        // table view 설정.
        setupTableView()
    }
    
    // MARK: - Functions
    
    // navigation bar 설정.
    func setupNav() {
        view.addSubview(ellipsisButton)
        ellipsisButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        ellipsisButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // large title 설정.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "News"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .semibold)]
        
        // right bar button item을 커스텀한 버튼으로 지정.
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ellipsisButton)
    }
    
    // table view 설정.
    func setupTableView() {
        // table view 레이아웃 설정.
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 첫번째 cell의 top separator를 제거.
        tableView.tableHeaderView = UIView()
        
        // separator의 좌우 간격 설정.
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // 셀 내용 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }
        
        cell.titleLabel.text = articles[indexPath.row].title
        cell.contentLabel.text = articles[indexPath.row].content
        cell.articleImage.image = UIImage(named: articles[indexPath.row].image)
        
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
