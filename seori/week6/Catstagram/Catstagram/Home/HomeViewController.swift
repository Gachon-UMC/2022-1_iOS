//
//  HomeViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/15.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    // MARK: - Subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var catDataArray : [FeedModel] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // cell의 구분선을 제거.
        tableView.separatorStyle = .none
        
        // Nib 파일을 셀로 등록.
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        // Week 8 : API 연동.
        let input = FeedAPIInput(limit: 10, page: 0)
        FeedDataManager.feedDataManager(input, self)
    }

}

// MARK: - Extension about tableView

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 한 section에 몇 개의 cell을 넣을 것인지 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catDataArray.count + 1
    }
    
    // 어떠한 cell을 보여줄 것인지 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 첫 번째 cell에서만 story가 보이도록.
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()    // else -> 기본 셀을 반환.
            }
            
            // 피드 cell의 imageView를 catDataArray에 담긴 url에 매핑해준다.
            // indexPath.row의 값이 0일 때는 스토리 부분이고, 1일 때부터가 피드 부분이기 때문에 -1을 해준다.
            if let urlString = catDataArray[indexPath.row - 1].url {
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            
            // cell이 선택됐을 때 색깔 바뀌는 효과 제거.
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    // cell의 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 스토리가 보이는 첫번째 셀만 높이를 다르게 설정.
        if indexPath.row == 0 {
            return 80
        } else {
            return 590
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewFirstCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewFirstCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

// MARK: - Extension about collectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // section 하나당 cell을 몇 개 넣을 건지.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // 어떤 cell을 만들 건지.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    // cell의 사이즈 설정 (무조건 해야 됨!)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 50, height: 60)
    }
}

// MARK: - 서버 연동하고 나서 호출될 함수

extension HomeViewController {
    
    // API 연동이 성공했을 때 받은 데이터들을 가져온다.
    func successAPI(_ result : [FeedModel]) {
        // API로부터 받아온 데이터를 HomeViewController의 catDataArray 프로퍼티에 넘겨준다.
        catDataArray = result
        // 테이블뷰의 데이터가 바뀌었으니 reload.
        tableView.reloadData()
    }
}
