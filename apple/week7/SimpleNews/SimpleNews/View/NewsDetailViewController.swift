//
//  NewsDetailViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/05.
//

import UIKit

class NewsDetailViewController: UIViewController {
  
  // MARK: Variables
  var newsData: NewsData?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentTextView: UITextView!
  @IBOutlet weak var newsImage: UIImageView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.prefersLargeTitles = false
    
  }
  
  // MARK: Components config
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let news = newsData else { return }
    
    titleLabel.text = news.title ?? ""
    contentTextView.text = news.description ?? ""
    let imageUrl = URL(string: news.urlToImage ?? "")
    newsImage.kf.setImage(with: imageUrl)
    newsImage.layer.cornerRadius = 10
    
    let date = news.publishedAt?.replacingOccurrences(of: "-", with: ".")
    let endIdx = date!.index(date!.startIndex, offsetBy: 9)
    
    let dateStr = String(date![...endIdx])
    dateLabel.text = dateStr
    authorLabel.text = news.author
  }
}
