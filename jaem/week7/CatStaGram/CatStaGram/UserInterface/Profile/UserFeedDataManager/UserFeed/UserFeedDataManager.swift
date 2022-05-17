//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/15.
//


import Alamofire

class UserFeedDataManager {
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
}
