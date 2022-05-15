//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/28.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Subviews
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    // MARK: - Properties
    var userPosts: [GetUserPosts]? {
        // userPosts의 값이 변경될 때마다 컬렉션뷰를 리로드한다!!
        didSet {
            self.profileCollectionView.reloadData()
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // collection view 설정.
        setUpCollectionView()
        // 데이터 세팅.
        setupData()
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
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }

    // 데이터 세팅.
    private func setupData() {
        // API 통신을 통해 데이터를 가져온다.
        UserFeedDataManager.getUserFeed(self)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
// protocol을 채택!
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // section의 갯수도 여기서 설정해 줄 수 있다.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2    // 프로필 셀과 포스팅 셀.
    }
    
    // section마다 cell의 갯수를 다르게 설정한다 !!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1    // 프로필 셀은 1개만!
        default:
            return userPosts?.count ?? 0
        }
    }
    
    // 셀 내용 설정. -> section마다 다르게 !!
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section     // indexPath에 있는 section을 사용해서 section의 갯수를 받아온다.
        
        switch section {
        case 0:
            // 프로필 셀 생성.
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패...")
            }
            return cell
        default:
            // 포스팅 셀 생성.
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패...")
            }
            
            let itemIndex = indexPath.item
            
            if let cellData = self.userPosts {
                // 데이터가 있는 경우, cell에 데이터 전달.
                cell.setUpData(cellData[itemIndex].postImgUrl)
            }
            
            return cell
        }
    }
}

// collection view cell의 사이즈를 설정할 때는 UICollectionViewDelegateFlowLayout 프로토콜을 채택해야 한다.
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    // section마다 cell의 사이즈를 다르게 설정해줘야 한다.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // section 갯수.
        let section = indexPath.section
        // 게시물(정사각형) 한 변 길이 설정.
        let side = (collectionView.frame.width - 4) / 3
        
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(170))
        default:
            return CGSize(width: side, height: side)    // 정사각형.
        }
    }
    
    // cell의 행 사이 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 1
        }
    }
    
    // cell의 item 사이 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 1
        }
    }
}

// MARK: - API 통신 메소드
extension ProfileViewController {
    func successAPI(_ result: UserFeedModel) {
        // 받아온 데이터를 이곳의 프로퍼티에 저장.
        self.userPosts = result.result?.getUserPosts
    }
}
