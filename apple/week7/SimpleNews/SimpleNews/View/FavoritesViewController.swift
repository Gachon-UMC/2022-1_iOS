//
//  FavoritesViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/05.
//

import UIKit

// MARK: Delegate pattern
protocol returnNewsViewModel {
  func unfavoritesNewsData(newsViewModel: NewsViewModel)
}

class FavoritesViewController: UIViewController {
  // MARK: Variable
  var favoritesNewsViewModel: NewsViewModel!
  var delegate: returnNewsViewModel?
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TableView config
    let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
    self.tableView.register(nibName, forCellReuseIdentifier: "NewsTableViewCell")
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    self.configBarButtonItem()
  }
  
  // MARK: Actions
  func configBarButtonItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(tappedDeleteAllButton(sender:)))
  }
  
  @objc
  func tappedDeleteAllButton(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Delete Everything", message: "Are you sure you want to delete everything?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
    alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in
      
      self.favoritesNewsViewModel.resetHeartButton = 1
      self.favoritesNewsViewModel.removeAllFavoritesNews()
      self.delegate?.unfavoritesNewsData(newsViewModel: self.favoritesNewsViewModel)
      
      self.navigationController?.popViewController(animated: true)
    }))
    self.present(alert, animated: true)
  }
}

// MARK: TableView DataSource, Delegate
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.favoritesNewsViewModel?.favoritesNewsData?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
    
    cell.titleLabel.text = "\(self.favoritesNewsViewModel.favoritesNewsData?[indexPath.row].title ?? "none title")"
    cell.contentLabel.text = "\(self.favoritesNewsViewModel.favoritesNewsData?[indexPath.row].description ?? "none content")"
    let imageUrl = URL(string: self.favoritesNewsViewModel.favoritesNewsData?[indexPath.row].urlToImage ?? "")
    cell.newsImage.kf.setImage(with: imageUrl)
    cell.newsImage.layer.cornerRadius = 5
    cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    
    cell.heartButton.tag = indexPath.row
    cell.heartButton.addTarget(self, action: #selector(tappedUnheartButton(sender:)), for: .touchUpInside)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let newsDetailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
    
    newsDetailViewController.newsData = self.favoritesNewsViewModel.favoritesNewsData?[indexPath.row]
    
    self.show(newsDetailViewController, sender: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  @objc
  func tappedUnheartButton(sender: UIButton) {
    self.favoritesNewsViewModel.removeFavoritesNews(index: sender.tag)
    
    self.delegate?.unfavoritesNewsData(newsViewModel: self.favoritesNewsViewModel)
    
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
}
