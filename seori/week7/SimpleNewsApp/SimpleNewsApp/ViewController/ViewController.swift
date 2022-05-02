//
//  ViewController.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var model = ArticleModel()
    var articles = [Article]()
    
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
    
        // article 설정.
        model.delegate = self
        model.getArticles()
    }
    
    // MARK: - Functions
    
    // navigation bar 설정.
    func setupNav() {
        // ellipsisButton 레이아웃 설정.
        view.addSubview(ellipsisButton)
        ellipsisButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        ellipsisButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // ellipsisButton에 액션 연결.
        ellipsisButton.addTarget(self, action: #selector(tappedEllipsisButton), for: .touchUpInside)
        
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
    
    // ellipsisButton을 눌렀을 때 실행될 액션.
    @objc func tappedEllipsisButton() {
        // AlertController 생성.
        let alert = UIAlertController(title: nil, message: "Change News Source or Route", preferredStyle: .actionSheet)
        
        // alert에 들어갈 Actions 생성!
        // us의 기사를 가져온다.
        let americaAction = UIAlertAction(title: "America", style: .default, handler: {_ in self.model.getArticles(country: "us")
        })
        // china의 기사를 가져온다.
        let chinaAction = UIAlertAction(title: "China", style: .default, handler: {_ in self.model.getArticles(country: "ch")
        })
        // korea의 기사를 가져온다.
        let koreaAction = UIAlertAction(title: "Korea", style: .default, handler: {_ in self.model.getArticles(country: "kr")
        })
        let favoriteAction = UIAlertAction(title: "Route to Favorite Screen", style: .default, handler: {_ in
            // favoriteVC로 화면 전환.
            self.navigationController?.pushViewController(FavoriteViewController(), animated: true)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // favoriteAction의 타이틀 색을 orange 색으로 설정. (forKey의 값이 titleTextColor일 때에만 적용된다. 마음대로 변경 불가.)
        favoriteAction.setValue(UIColor.orange, forKey: "titleTextColor")
        
        // 컨트롤러에 액션 추가.
        alert.addAction(americaAction)
        alert.addAction(chinaAction)
        alert.addAction(koreaAction)
        alert.addAction(favoriteAction)
        alert.addAction(cancelAction)
        
        // alert를 띄운다.
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - ArticleModelProtocol

extension ViewController: ArticleModelProtocol {
    
    func articlesRetrieved(articles: [Article]) {
        print("Get returned articles data from ArticleModel")
        self.articles = articles    // 받아온 데이터를 ViewController에 저장.
        
        // articles 데이터를 받아온 이후에 테이블뷰를 다시 업데이트 해야 한다.
        tableView.reloadData()
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
        
        // articles 배열에 든 구조체 article의 데이터를 행마다 하나씩 보여준다.
        cell.displayArticle(article: articles[indexPath.row])
        
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    // 셀이 선택됐을 때 실행되는 함수.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 셀 생성.
        let selectedRow = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        let currentCell = tableView.cellForRow(at: selectedRow!) as! CustomTableViewCell
        
        // detailVC에 들어갈 데이터 설정.
        let detailVC = DetailViewController()
        detailVC.articleTitle.text = currentCell.titleLabel.text
        detailVC.articleImage.image = currentCell.articleImage.image ?? nil
        detailVC.articleContent.text = currentCell.contentLabel.text
        
        // currentCell의 isLiked 값을 detailVC의 isLiked로 넘겨줌.
        detailVC.isLiked = currentCell.isLiked
        // detailVC로 화면 전환.
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
