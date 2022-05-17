//
//  News.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/12.
//

import Foundation

struct Article:Codable{
    let title: String?
    let description: String?
    let urlToImage: String?
    let author: String?
    let publishedAt: String?
}
