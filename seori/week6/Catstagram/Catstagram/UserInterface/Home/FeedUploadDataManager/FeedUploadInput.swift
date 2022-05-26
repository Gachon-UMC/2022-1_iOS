//
//  FeedUploadInput.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/14.
//

// 사진을 Upload 할 때 보낼 Request body의 형태.
struct FeedUploadInput : Encodable {
    var content : String?
    var postImgsUrl : [String]?     // String List의 형태. ex) ["imgUrl1", "imgUrl2"]
}
