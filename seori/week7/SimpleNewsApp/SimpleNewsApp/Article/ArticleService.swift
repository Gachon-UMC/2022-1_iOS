//
//  ArticleService.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/02.
//

import Foundation

// 실제로 News Api에서 받게될 데이터 모양.
// 이 중에 articles의 데이터를 가져와서 저장해야 한다.
struct ArticleService: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}
