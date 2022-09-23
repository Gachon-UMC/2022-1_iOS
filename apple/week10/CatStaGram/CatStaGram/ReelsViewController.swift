//
//  ReelsViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/17.
//

import UIKit

class ReelsViewController: UIViewController {
  // MARK: Properties
  @IBOutlet weak var collectionView: UICollectionView!
  private var nowPage = 0
  
  private let videoURLStrArr = ["dummyVideo1", "dummyVideo2"]
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  // MARK: Actions
  
  // MARK: Helpers
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.decelerationRate = .fast // scroll speed
    collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
    
    startLoop()
  }
  
  private func startLoop() {
    let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in // 2초마다 반복
      self.moveNextPage()
    }
  }
  
  private func moveNextPage() {
    let itemCount = collectionView.numberOfItems(inSection: 0)
    
    nowPage += 1
    if (nowPage >= itemCount) {
      // 마지막 페이지에 도달한 경우
      nowPage = 0
    }
    
    // 증가된 nowPage로 이동
    collectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .centeredVertically, animated: true)
  }
}

// MARK: UICollectionViewDelegate, DataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
    
    cell.setupURL(videoURLStrArr.randomElement()!) // 랜덤으로 url 전달 (controller -> Cell -> View 순으로 전달)
    return cell
  }
  
  // cell의 displaying이 끝났을 때 메모리 비워주기
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
      cell.videoView?.cleanup()
    }
  }
}

extension ReelsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}
