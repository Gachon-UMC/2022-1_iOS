//
//  ViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/03.
//

import UIKit

import Alamofire

class ViewController: UIViewController, returnNewsViewModel {
  // MARK: Variables
  var newsViewModel: NewsViewModel! // ViewModel
  
  @IBOutlet weak var tableview: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.newsViewModel = NewsViewModel() // ViewModel 생성
    self.newsViewModel.getNewsData(country: "us", viewController: self)
    self.navigationController?.navigationBar.prefersLargeTitles = true

    // tableView config
    let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
    self.tableview.register(nibName, forCellReuseIdentifier: "NewsTableViewCell")
    self.tableview.dataSource = self
    self.tableview.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableview.reloadData()
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  // MARK: Delegate pattern
  func unfavoritesNewsData(newsViewModel: NewsViewModel) {
    self.newsViewModel = newsViewModel
    if newsViewModel.resetHeartButton == 1 {
      self.newsViewModel.removeAllFavoritesNews()
      self.tableview.reloadData()
    }
  }
  
  // MARK: Actions
  @IBAction func barButtonItemTapped(_ sender: UIBarButtonItem) {
    let actionSheet = UIAlertController(title: "Change News Source or Route", message: nil, preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "America", style: .default, handler: {_ in
      self.newsViewModel.getNewsData(country: "us", viewController: self)
    }))
    actionSheet.addAction(UIAlertAction(title: "China", style: .default, handler: {_ in
      self.newsViewModel.getNewsData(country: "ch", viewController: self)
    }))
    actionSheet.addAction(UIAlertAction(title: "Korea", style: .default, handler: {_ in
      self.newsViewModel.getNewsData(country: "kr", viewController: self)
    }))
    let favoriteAction = UIAlertAction(title: "Route to Favorite Screen", style: .default, handler: {_ in
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      guard let favoritesViewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController else { return }
      
      favoritesViewController.delegate = self
      favoritesViewController.favoritesNewsViewModel = self.newsViewModel
      
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
    return self.newsViewModel.newsData?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableview.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }

    // set title, content, image
    cell.titleLabel.text = "\(self.newsViewModel.newsData?[indexPath.row].title ?? "none title")"
    cell.contentLabel.text = "\(self.newsViewModel.newsData?[indexPath.row].description ?? "none content")"
    let imageURL = URL(string: self.newsViewModel.newsData?[indexPath.row].urlToImage ?? "")
    cell.newsImage.kf.setImage(with: imageURL)
    cell.newsImage.layer.cornerRadius = 5
    cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    
    // config heart button
    cell.heartButton.tag = indexPath.row
    cell.heartButton.addTarget(self, action: #selector(tappedHeartButton(sender:)), for: .touchUpInside)
    
    for news in self.newsViewModel.favoritesNewsData! {
      if news.title == self.newsViewModel.newsData![indexPath.row].title {
        cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      } else {
        cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
      }
    }

    return cell
  }
  
  @objc
  func tappedHeartButton(sender: UIButton) {
    let indexPath = IndexPath(row: sender.tag, section: 0)
    let cell = tableview.cellForRow(at: indexPath) as? NewsTableViewCell
    
    if cell?.heartButton.currentImage == UIImage(systemName: "heart") {
      cell?.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      self.newsViewModel.addFavoritesNews(data: self.newsViewModel.newsData![indexPath.row])
    } else {
      cell?.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
      self.newsViewModel.favoritesNewsData = self.newsViewModel.favoritesNewsData!.filter {
        $0.urlToImage != self.newsViewModel.newsData![indexPath.row].urlToImage
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let newsDetailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
    
    newsDetailViewController.newsData = self.newsViewModel.newsData?[indexPath.row]
    
    self.show(newsDetailViewController, sender: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}

//#if canImport(SwiftUI) && (DEBUG)
//    import SwiftUI
//
//    struct ViewControllerRepresentable: UIViewControllerRepresentable {
//
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//    }
//
//    struct ViewController_Preview: PreviewProvider {
//
//        static var previews: some View {
//          ViewControllerRepresentable(viewController: UINavigationController(rootViewController: ViewController()))
//        }
//    }
//#endif
