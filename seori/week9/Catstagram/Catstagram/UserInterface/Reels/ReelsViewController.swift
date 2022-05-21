//
//  ReelsViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/21.
//

import UIKit

class ReelsViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0     // 현재 릴스 페이지 번호.
    
    private var videoURLStrArr = ["DummyVideo01", "DummyVideo02", "DummyVideo03"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        startLoop()     // 컬렉션뷰 세팅 다 되고 나면 실행.
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast     // 스크롤이 빨리 되도록 설정.
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
    }
    
    // 타이머 설정. -> 3초마다 다음 페이지로 이동되도록.
    private func startLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.moveNextPage()     // 3초가 지날 때마다 이 클로져의 내용이 실행된다.
        }
    }
    
    // 다음 페이지로 넘어가게 하는 메서드.
    private func moveNextPage() {
        // 섹션 0의 아이템 갯수.
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        // 다음 릴스로 이동.
        nowPage += 1
        
        if (nowPage >= itemCount) {
            // 마지막 페이지 일 때 -> 처음 페이지로 돌아갈 수 있도록 설정.
            nowPage = 0
        }
        
        // 특정 indexPath의 item으로 collection view를 스크롤시킨다.
        collectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0),   // 다음 페이지로 이동.
            at: .centeredVertically,    // 수직으로 스크롤.
            animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // item 갯수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        videoURLStrArr.count
    }
    
    // item 내용 설정.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { fatalError() }
        
        cell.setupURL(videoURLStrArr.randomElement()!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // item이(= 영상이) Displaying이 끝나면 메모리를 해제해 준다.
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell { // 해당 셀에 접근 성공했다면 { } 안을 실행.
            cell.videoView?.cleanup()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
/// collection view 크기 설정.
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    
    // item 사이즈 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // item 사이즈를 collection view에 꽉차게 설정.
        CGSize(width: collectionView.frame.width,
               height: collectionView.frame.height)
    }
    
    // item 사이 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
