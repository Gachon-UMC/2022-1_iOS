//
//  FeedUploadInput.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

struct FeedUploadInput: Encodable {
  var content: String?
  var postImageUrl: [String]?
}
