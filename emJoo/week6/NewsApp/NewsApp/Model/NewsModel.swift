//
//  NewsModel.swift
//  NewsApp
//
//  Created by 이해주 on 2022/05/03.
//

import Foundation

struct Newsfeed: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Codable {
    let title: String
    let description: String
    let urlToImage: URL
}


