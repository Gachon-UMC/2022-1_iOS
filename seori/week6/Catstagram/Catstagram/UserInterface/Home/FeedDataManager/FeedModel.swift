//
//  FeedModel.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/14.
//

// API의 Response로 id와 url을 받아온다.
struct FeedModel : Decodable {
    var id : String?
    var url : String?
}
