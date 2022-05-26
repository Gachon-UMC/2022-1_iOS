//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/27.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
  // MARK: - Properties
  @IBOutlet weak var profileCollectionView: UICollectionView!
  
  var userPosts: [GetUserPosts]? {
    didSet { self.profileCollectionView.reloadData() }
  } // 데이터를 불러오는 시점이 UI를 제공하는 시점보다 늦기 때문에 API에서 데이터를 받아서 변수의 값이 바뀌면 reload
  var deletedIndex: Int?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
    setupData()
  }
  
  // MARK: - Actions
  @objc
  func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
    if gestureRecognizer.state != .began { return } // 방어코드 (상태값을 확인)
    
    let position = gestureRecognizer.location(in: profileCollectionView)
    
    if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
      guard let userPosts = self.userPosts else { return }
      let cellData = userPosts[indexPath.item]
      self.deletedIndex = indexPath.item // 로컬에서도 데이터를 삭제하기 위해 선택된 cell의 index 저장
      if let postIdx = cellData.postIdx {
        // 삭제 API 호출
        UserFeedDataManager().deleteUserFeed(self, postIdx)
      }
    }
  }
  
  
  // MARK: - Helpers
  private func setupCollectionView() {
    // delegate 연결
    profileCollectionView.delegate = self
    profileCollectionView.dataSource = self
    
    // cell 등록
    profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier) // ProfileCollectionViewCell Class의 정적변수 identifier
    
    profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    
    // gesture
    let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell(gestureRecognizer:)))
    gesture.minimumPressDuration = 0.66
    gesture.delegate = self
    gesture.delaysTouchesBegan = true
    profileCollectionView.addGestureRecognizer(gesture)
  }
  
  private func setupData() {
    UserFeedDataManager().getUserFeed(self)
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
    default:
      return userPosts?.count ?? 0 // API로부터 받은 데이터의 수만큼
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
      
      let itemIndex = indexPath.item
      
      if let cellData = self.userPosts {
        cell.setupData(cellData[itemIndex].postImgUrl)
      }
      
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

// MARK: API
extension ProfileViewController {
  func successFeedAPI(_ result: UserFeedModel) {
    self.userPosts = result.result?.getUserPosts
  }
  
  func successDeletePostAPI(_ isSuccess: Bool) {
    guard isSuccess else { return }
    
    if let deletedIndex = self.deletedIndex {
      self.userPosts?.remove(at: deletedIndex) // index로 삭제
    }
  }
}
