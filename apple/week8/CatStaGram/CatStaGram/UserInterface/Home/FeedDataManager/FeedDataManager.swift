//
//  FeedDataManager.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

import Alamofire

class FeedDataManager {
  // FeedAPIInput 구조체를 인자로 받아 FeedModel struct 형식으로 디코딩하여 데이터 request
  // 데이터를 성공적으로 받아오면 completionHandler의 response로 데이터가 담김
  func feedDataManager(_ parameters: FeedAPIInput, _ viewController: HomeViewController) {
    AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
      switch response.result {
      case .success(let result): // result에는 [FeedModel] 배열이 담김
        viewController.successAPI(result) // HomeViewController의 arrayCat에 데이터가 담기고 테이블 뷰 리로드
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
