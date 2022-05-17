//
//  NewsService.swift
//  NewsApp
//
//  Created by 송재민 on 2022/05/12.
//

import Foundation

struct ArticleService:Codable{
    var status:String?
    var totalResults:Int?
    var articles:[Article]?
}
