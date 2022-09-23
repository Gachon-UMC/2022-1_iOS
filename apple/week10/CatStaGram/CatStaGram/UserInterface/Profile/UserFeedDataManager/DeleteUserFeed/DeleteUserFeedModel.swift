//
//  DeleteUserFeedModel.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/10.
//

import Foundation

struct DeleteUserFeedModel: Decodable {
  let isSuccess: Bool?
  let code: Int?
  let message: String?
  let result: String?
}
