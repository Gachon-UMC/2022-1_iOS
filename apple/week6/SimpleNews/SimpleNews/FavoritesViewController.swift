//
//  FavoritesViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/05.
//

import UIKit

protocol isDeleteAllButtonTapped {
  func isDeleteAllButtonTapped(isTapped: Int)
}

class FavoritesViewController: UIViewController {
  var favoritesNewsData: [NewsData] = []
  var delegate: isDeleteAllButtonTapped?
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
    self.tableView.register(nibName, forCellReuseIdentifier: "NewsTableViewCell")
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    self.configBarButtonItem()
  }
  
  func configBarButtonItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(tappedDeleteAllButton(sender:)))
  }
  
  @objc
  func tappedDeleteAllButton(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Delete Everything", message: "Are you sure you want to delete everything?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
    alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in
      
      // ViewController에 데이터 1 전달
      self.delegate?.isDeleteAllButtonTapped(isTapped: 1)
      self.navigationController?.popViewController(animated: true)
    }))
    self.present(alert, animated: true)
  }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.favoritesNewsData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
    
    cell.titleLabel.text = "\(favoritesNewsData[indexPath.row].title ?? "none title")"
    cell.contentLabel.text = "\(favoritesNewsData[indexPath.row].description ?? "none content")"
    let imageUrl = URL(string: favoritesNewsData[indexPath.row].urlToImage ?? "")
    cell.newsImage.kf.setImage(with: imageUrl)
    cell.newsImage.layer.cornerRadius = 5
    cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let newsDetailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
    
    newsDetailViewController.newsData = favoritesNewsData[indexPath.row]
    
    self.show(newsDetailViewController, sender: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}
