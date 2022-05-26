//
//  UserFeedDataManager.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/15.
//

import Alamofire

class UserFeedDataManager {
    
    // MARK: - 유저 피드 조회 API
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
    
    // MARK: - 게시물 삭제 API
    public static func deleteUserFeed(_ viewController : ProfileViewController,
                                  _ postIdx : Int) {
       // API 통신
       AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                  method: .patch,
                  parameters: nil)
           .validate()
           .responseDecodable(of: DeleteUserFeed.self) { response in
               
               switch response.result {
               case .success(let result):
                   viewController.successDeletePostAPI(result.isSuccess ?? false)
                   
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
   }
}
