//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

// Base URL: https://edu-api-ios-test.softsquared.com

import Alamofire

class UserFeedDataManager {
  // MARK: 유저 피드 조회 API
  // string 보간법으로 userID를 url에 대입 (테스트 서버라 2번만 가능: 기본값 2)
  // 데이터를 성공적으로 받아오면 completionHandler의 response로 데이터가 담김
  // 기본값을 가지는 매개변수는 제일 마지막으로
  func getUserFeed(_ viewController: ProfileViewController, _ userID: Int = 2) {
    AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
               method: .get, parameters: nil)
      .validate()
      .responseDecodable(of: UserFeedModel.self) { response in
      switch response.result {
      case .success(let result):
        viewController.successFeedAPI(result) // API로부터 받은 데이터를 ProfileViewController의 멤버변수에 전달하고, 그 멤버변수에 담긴 데이터를 기반으로 Profile의 피드에 이미지 set
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  // MARK: 게시물 삭제 API
  func deleteUserFeed(_ viewController: ProfileViewController, _ postIdx: Int) {
    AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
               method: .patch, parameters: nil)
      .validate()
      .responseDecodable(of: DeleteUserFeedModel.self) { response in
      switch response.result {
      case .success(let result):
        viewController.successDeletePostAPI(result.isSuccess ?? false)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
