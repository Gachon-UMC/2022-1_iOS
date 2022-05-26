//
//  StoryTableViewCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/09.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

  @IBOutlet weak var collectionView: UICollectionView!
  
  // HomeViewController에서 접근하기 위한 함수
  func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
    collectionView.delegate = dataSourceDelegate
    collectionView.dataSource = dataSourceDelegate
    collectionView.tag = row
    
    let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
    collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
    
    // CollectionView Cell config
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) // 상위 View로부터의 간격
    flowLayout.minimumLineSpacing = 12 // cell 간의 간격
    collectionView.collectionViewLayout = flowLayout
    
    collectionView.reloadData()
  }
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
