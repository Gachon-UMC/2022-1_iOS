//
//  ReelsViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/21.
//

import Foundation
import UIKit

class ReelsViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // item 갯수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    // item 내용 설정.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { fatalError() }
        
        return cell
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
