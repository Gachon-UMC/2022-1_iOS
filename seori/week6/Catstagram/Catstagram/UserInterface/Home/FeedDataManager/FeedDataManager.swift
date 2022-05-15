//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/14.
//

import Alamofire

// 구조체로 만든 Request 형태(FeedAPIInput)로 API를 호출하고, 만든 Response 형태(FeedModel)로 데이터를 받아온다.
class FeedDataManager {
    
    public static func feedDataManager(_ input : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search",
                   method: .get,
                   parameters: input)
            .validate()
            .responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                // successAPI 함수를 통해 HomeViewController에다가 API result 값을 전달.
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
