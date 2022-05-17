//
//  FeedUploadModel.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/15.
//

struct FeedUploadModel : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable{
    var postIdx : Int?
}
