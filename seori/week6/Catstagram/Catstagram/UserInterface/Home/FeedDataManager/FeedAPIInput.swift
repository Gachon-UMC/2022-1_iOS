//
//  FeedAPIInput.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/14.
//

// The Cat API의 Request Parameters 중 limit, page 2개만 가지고 데이터를 요청한다.
struct FeedAPIInput : Encodable {
    var limit : Int?
    var page : Int?
}
