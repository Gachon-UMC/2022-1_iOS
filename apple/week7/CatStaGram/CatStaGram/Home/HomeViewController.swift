//
//  HomeViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/09.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // tableView config
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none // cell 구분선 x
    let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
    tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
    tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
  }
  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 { // 첫 번째 cell일 경우
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
      
      return cell
    } else {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
      
      cell.selectionStyle = .none // none highlight, when cell selected
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 80
    } else {
      return 600
    }
  }
  
  // cell이 보여지기 직전
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let tableViewcell = cell as? StoryTableViewCell else {
      return
    }
    
    tableViewcell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
  }
}

// UICollectionViewDelegateFlowLayout도 필수로 채택 -> TableViewCell과 다르게 Nib에 기본 UIView가 없기 때문
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 50, height: 60)
  }
}
