//
//  UserFeedDataManager.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/15.
//

import Alamofire

class UserFeedDataManager {
    
    public static func getUserFeed(_ viewController : ProfileViewController,
                                   _ userIdx : Int = 2) {
        // API 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userIdx)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                
                switch response.result {
                case .success(let result):
                    viewController.successAPI(result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
}
