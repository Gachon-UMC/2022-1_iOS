//
//  DeleteUserFeed.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/15.
//

import Foundation

struct DeleteUserFeed : Decodable{
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
