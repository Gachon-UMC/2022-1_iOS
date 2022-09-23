//
//  FeedAPIInput.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

struct FeedAPIInput: Encodable {
  var limit: Int?
  var page: Int?
}
