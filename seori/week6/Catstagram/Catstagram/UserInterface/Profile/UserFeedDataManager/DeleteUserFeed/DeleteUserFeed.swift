//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/16.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
