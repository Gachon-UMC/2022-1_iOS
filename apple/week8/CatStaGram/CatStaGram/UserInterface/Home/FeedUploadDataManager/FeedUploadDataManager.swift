//
//  FeedUploadDataManager.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

import Alamofire

class FeedUploadDataManager {
  func posts(_ parameters: FeedUploadInput, _ viewController: HomeViewController) {
    // post로 request -> 데이터를 서버에 전달 (JSON 형태로 encoding하여 전달)
    AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
      switch response.result {
      case .success(let result):
        if result.isSuccess {
          print("성공")
        } else {
          print(result.massage)
        }
      case .failure(let error):
        print("===")
        print(error.localizedDescription)
      }
    }
  }
}
