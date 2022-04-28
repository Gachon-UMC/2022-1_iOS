//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/28.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // collection view 설정.
        setUpCollectionView()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    
    // collection view 설정.
    private func setUpCollectionView() {
        // delegate 설정.
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록.
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
// protocol을 채택!
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
//            return UICollectionViewCell()
            fatalError("셀 타입 캐스팅 실패...")
        }
        return cell
    }
}

// collection view cell의 사이즈를 설정할 때는 UICollectionViewDelegateFlowLayout 프로토콜을 채택해야 한다.
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView .frame.width, height: CGFloat(170))
    }
}
