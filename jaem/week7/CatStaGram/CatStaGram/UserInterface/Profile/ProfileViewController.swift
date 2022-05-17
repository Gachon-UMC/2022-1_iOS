//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/04/30.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]?{
        didSet{self.profileCollectionView.reloadData()}
    }
    
    var deletedIndex: Int?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        setupData()
    }
    
    //MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state != .began{return}
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position){
            print("Debug : ", indexPath.item)
            
            guard let userPosts = self.userPosts else {return}
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx{
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
            
            //삭제 api 호출
            UserFeedDataManager().deleteUserFeed(self, 17)
        }
    }

    //MARK: - Helpers
    private func setupCollectionView(){
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
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

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            
            let itemIndex = indexPath.item
            
            if let cellData = self.userPosts{
                
                cell.setupData(cellData[itemIndex].postImgUrl)
            }
            
            return cell
        }
        
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(width: side, height: side)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel){
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool){
        guard isSuccess else{return}
        
        if let deletedIndex = self.deletedIndex{
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
