//
//  HomeViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/04/09.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var arrayCat: [FeedModel] = []
  
  let imagePickerViewcontroller = UIImagePickerController() // camera & album view controller
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // tableView config
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none // cell 구분선 x
    let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
    tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
    tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    
    let input = FeedAPIInput(limit: 30, page: 10)
    FeedDataManager().feedDataManager(input, self)
    
    imagePickerViewcontroller.delegate = self
  }
  
  @IBAction func buttonGoAlbum(_ sender: Any) {
    self.imagePickerViewcontroller.sourceType = .photoLibrary // camera, album 등 선택
    self.present(imagePickerViewcontroller, animated: true, completion: nil)
  }
}

// MARK: TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayCat.count + 1 // tableView의 row는 arrayCat + 1 (0 row는 스토리)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 { // 첫 번째 cell일 경우
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
      
      return cell
    } else {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
      
//      cell.selectionStyle = .none // none highlight, when cell selected
      if let urlString = arrayCat[indexPath.row - 1].url {// 0 row는 스토리이기 때문에 첫 indexpath.row는 1이다. 따라서 -1하여 0 index부터 load
        let url = URL(string: urlString)
        cell.imageViewFeed.kf.setImage(with: url)
      }
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 80
    } else {
      return 600
    }
  }
  
  // cell이 보여지기 직전
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let tableViewcell = cell as? StoryTableViewCell else {
      return
    }
    
    tableViewcell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
  }
}

// MARK: Collection View
// UICollectionViewDelegateFlowLayout도 필수로 채택 -> TableViewCell과 다르게 Nib에 기본 UIView가 없기 때문
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 50, height: 60)
  }
}

// MARK: API
extension HomeViewController {
  // 불러온 데이터를 전달하면 arrayCat 클래스 인스턴스에 담고 테이블 뷰 리로드
  func successAPI(_ result: [FeedModel]) {
    arrayCat = result
    tableView.reloadData()
  }
}

// MARK: ImagePickerContoller
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  // 앨범에서 사진이 선택되었을 때
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // image에 선택된 사진이 UIImage 형태로 담김
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      // 이미지 파일을 Firebase와 연동하여 url로 바꾸고 서버로 Post
      // imageString은 강의에서 미리 url로 바꾼 것 -> 직접 Firebase Storage를 이용하여 바꾸거나 Multipart를 사용하여 구현할 것 (현재 피드에서 보여지는 사진 데이터의 API와 post의 API가 다름)
      let imageString = "gs://catstargram-d7fbf.appspot.com/Cat"
      let input = FeedUploadInput(content: "가천냥이입니다. 귀엽죵", postImageUrl: [imageString])
      FeedUploadDataManager().posts(input, self)
      
      self.dismiss(animated: true, completion: nil)
    }
  }
}
