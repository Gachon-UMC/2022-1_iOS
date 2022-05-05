//
//  ViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/03.
//

import UIKit

import Alamofire

class ViewController: UIViewController, isDeleteAllButtonTapped {
  var newsData: [NewsData] = []
  var favoritesNewsData: [NewsData] = []
  var resetHeartButton: Int = 0
  
  @IBOutlet weak var tableview: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.fetchNewsOverview(contry: "us")

    // tableView config
    let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
    self.tableview.register(nibName, forCellReuseIdentifier: "NewsTableViewCell")
    self.tableview.dataSource = self
    self.tableview.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // favorites page로부터 1을 받았을 때, tableview reload
    if self.resetHeartButton == 1 {
      favoritesNewsData.removeAll()
      DispatchQueue.main.async {
        self.tableview.reloadData()
      }
    }
  }
  
  func isDeleteAllButtonTapped(isTapped: Int) {
    self.resetHeartButton = isTapped
  }

  // Data load
  func fetchNewsOverview(contry: String) {
    let url = "https://newsapi.org/v2/top-headlines?country=\(contry)&apiKey=03b86d8db9494091827fbe501a17d37a"

    AF.request(url, method: .get, parameters: nil).responseData{ response in
      switch response.result {
      case let .success(data):
        do {
          let result = try JSONDecoder().decode(NewsOverview.self, from: data)
          self.newsData = result.articles
          DispatchQueue.main.async {
            self.tableview.reloadData()
          }
        } catch(let error) {
          print(error.localizedDescription)
        }
      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
  
  @IBAction func barButtonItemTapped(_ sender: UIBarButtonItem) {
    let actionSheet = UIAlertController(title: "Change News Source or Route", message: nil, preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "America", style: .default, handler: {_ in
      self.fetchNewsOverview(contry: "us")
    }))
    actionSheet.addAction(UIAlertAction(title: "China", style: .default, handler: {_ in
      self.fetchNewsOverview(contry: "ch")
    }))
    actionSheet.addAction(UIAlertAction(title: "Korea", style: .default, handler: {_ in
      self.fetchNewsOverview(contry: "kr")
    }))
    let favoriteAction = UIAlertAction(title: "Route to Favorite Screen", style: .default, handler: {_ in
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      guard let favoritesViewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController else { return }
      
      favoritesViewController.delegate = self
      favoritesViewController.favoritesNewsData = self.favoritesNewsData
      
      self.show(favoritesViewController, sender: nil)
    })
    favoriteAction.setValue(UIColor.orange, forKey: "titleTextColor")
    actionSheet.addAction(favoriteAction)
    actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel))
    
    self.present(actionSheet, animated: true, completion: nil)
  }
  
}

// MARK: TableView DataSource, Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.newsData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableview.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }

    // set title, content, image
    cell.titleLabel.text = "\(newsData[indexPath.row].title ?? "none title")"
    cell.contentLabel.text = "\(newsData[indexPath.row].description ?? "none content")"
    let imageURL = URL(string: newsData[indexPath.row].urlToImage ?? "")
    cell.newsImage.kf.setImage(with: imageURL)
    cell.newsImage.layer.cornerRadius = 5
    cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    
    // config heart button
    cell.heartButton.tag = indexPath.row
    cell.heartButton.addTarget(self, action: #selector(tappedHeartButton(sender:)), for: .touchUpInside)

    return cell
  }
  
  @objc
  func tappedHeartButton(sender: UIButton) {
    let indexPath = IndexPath(row: sender.tag, section: 0)
    let cell = tableview.cellForRow(at: indexPath) as? NewsTableViewCell
    
    if cell?.heartButton.currentImage == UIImage(systemName: "heart") {
      cell?.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      favoritesNewsData.append(newsData[indexPath.row]) // heart check 된 index 저장
    } else {
      cell?.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
      favoritesNewsData = favoritesNewsData.filter { $0.urlToImage != newsData[indexPath.row].urlToImage } // heart unckeck 된 index 삭제
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let newsDetailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
    
    newsDetailViewController.newsData = newsData[indexPath.row]
    
    self.show(newsDetailViewController, sender: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}

