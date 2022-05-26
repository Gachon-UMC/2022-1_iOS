//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/14.
//

// 사진 Upload를 요청했을 때 받게 될 Response의 형태.
struct FeedUploadModel : Decodable {
    var isSuccess : Bool?
    var code : Int?
    var message : String?
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
