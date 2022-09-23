//
//  UserFeedModel.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/09.
//

// Profile의 피드로 불러올 데이터 모델

struct UserFeedModel: Decodable {
  let isSuccess: Bool?
  let code: Int?
  let message: String?
  let result: UserFeedModelResult?
}

struct UserFeedModelResult: Decodable {
  let _isMyFeed: Bool?
  let getUserInfo: GetUserInfo?
  let getUserPosts: [GetUserPosts]?
}

struct GetUserInfo: Decodable {
  let userIdx: Int?
  let nickName: String?
  let name: String?
  let profileImgUrl: String?
  let website: String?
  let introduction: String?
  let followerCount: Int?
  let followingCount: Int?
  let postCount: Int?
}

struct GetUserPosts: Decodable {
  let postIdx: Int?
  let postImgUrl: String?
}
