//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/15.
//


import Alamofire

class UserFeedDataManager {
    // MARK: 유저 피드 조회 api
    func getUserFeed(_ viewController : ProfileViewController, _ userID : Int = 2){
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)", method: .get, parameters: nil).validate().responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case .success(let result):
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: 게시물 삭제 api
    func deleteUserFeed(_ viewController : ProfileViewController, _ postIdx : Int){
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status", method: .patch, parameters: nil).validate().responseDecodable(of: DeleteUserFeed.self) { response in
            switch response.result{
            case .success(let result):
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
