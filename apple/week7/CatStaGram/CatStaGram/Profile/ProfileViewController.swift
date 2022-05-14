//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/27.
//

import UIKit

class ProfileViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet weak var profileCollectionView: UICollectionView!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
  }
  
  // MARK: - Actions
  
  
  // MARK: - Helpers
  private func setupCollectionView() {
    // delegate 연결
    profileCollectionView.delegate = self
    profileCollectionView.dataSource = self
    
    // cell 등록
    profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier) // ProfileCollectionViewCell Class의 정적변수 identifier
    
    profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 24
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let section = indexPath.section
    
    switch section {
    case 0: // Profile
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
        fatalError("Cell type casting fail ...")
      }
      return cell
    case 1: // Post
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
        fatalError("Cell type casting fail ...")
    }
//      cell.setupData() // image load
      return cell
    default:
      return UICollectionViewCell()
    }
    
  }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let section = indexPath.section
    
    switch section {
    case 0: // Profile
      return CGSize(width: collectionView.frame.width, height: CGFloat(159)) // Core Graphic Size return
    case 1: // Post
      let side = CGFloat((collectionView.frame.width / 3) - (4/3)) // 전체 width를 3으로 나눈 값이 한 변의 길이 (3개의 cell 사이에 2개의 공간을 위한 -4 (양 끝도 고려) / 분모 3 둘 다 없어지며 -4
      return CGSize(width: side, height: side) // Core Graphic Size return
    default:
      return CGSize(width: 0, height: 0)
    }
  }
  
  // item 사이의 spacing (열 간 간격)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    switch section {
    case 0:
      return CGFloat(0)
    case 1:
      return CGFloat(1)
    default:
      return CGFloat(0)
    }
  }
  
  // line 사이의 spacing (행 간 간격)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    switch section {
    case 0:
      return CGFloat(0)
    case 1:
      return CGFloat(1)
    default:
      return CGFloat(0)
    }
  }
}
