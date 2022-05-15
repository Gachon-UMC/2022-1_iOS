//
//  StoryTableViewCell.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/16.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.dataSource = dataSourceDelegate
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        // 컬렉션 뷰의 플로우 레이아웃 설정!!
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal    // 가로로 스크롤 되도록 설정.
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)     // 컬렉션 뷰의 각각의 셀의 상하좌우 마진을 설정.
        flowLayout.minimumLineSpacing = 12  // 그 각 셀들 사이의 간격을 설정.
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
