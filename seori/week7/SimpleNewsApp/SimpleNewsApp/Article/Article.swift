//
//  Article.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/02.
//

import Foundation

// 기사의 정보.
// Codable : Json 데이터를 Swift 객체로 만들거나, Swift 객체를 Json 데이터로 변환시켜주기 위해서 사용하는 노테이션.
struct Article: Codable {
    // 해당 API가 주는 정보들 중에 SimpleNewsApp에서 받아서 사용할 것들만 구조체로 정의한다.
    var title: String?
    var description: String?
    var urlToImage: String?
}
