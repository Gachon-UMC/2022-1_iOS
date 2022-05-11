//
//  NewsDetailViewController.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/05.
//

import UIKit

class NewsDetailViewController: UIViewController {
  
  var newsData: NewsData?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentTextView: UITextView!
  @IBOutlet weak var newsImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let news = newsData else { return }
    
    titleLabel.text = news.title ?? ""
    contentTextView.text = news.description ?? ""
    let imageUrl = URL(string: news.urlToImage ?? "")
    newsImage.kf.setImage(with: imageUrl)
  }
}
