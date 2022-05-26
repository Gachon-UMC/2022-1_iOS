//
//  FeedUploadModel.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

struct FeedUploadModel: Decodable {
  var isSuccess: Bool
  var code: Int
  var massage: String
  var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
  var postIdx: Int?
}
