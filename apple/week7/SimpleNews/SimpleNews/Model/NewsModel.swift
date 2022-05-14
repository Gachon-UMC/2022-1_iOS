//
//  NewsOverview.swift
//  SimpleNews
//
//  Created by 조동진 on 2022/05/03.
//

struct NewsModel: Codable {
  let status: String
  let totalResults: Int
  let articles: [NewsData]
}

struct NewsData: Codable {
  let source: Source
  let author: String?
  let title: String?
  let description: String?
  let url: String?
  let urlToImage: String?
  let publishedAt: String?
  let content: String?
}

struct Source:Codable {
  let id: String?
  let name: String?
}


