//
//  ArticleModel.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/05/01.
//

import Foundation

class ArticleModel {
    
    // 기사의 정보.
    struct article {
        let title : String
        let content : String
        let image : String
    }
    
    // 배열에 기사를 넣어서 저장.
    static let articles = [
        article(title: "Five things iOS developers should focus on in 2022", content: "In this short post I’ve listed five things that I believe will help you become a better developer in 2022. Or rather, the first half of 2022. I’m fully expecting Apple to release some cool new interesting things at this year’s WWDC that deserve some of your attention in the second half of the year. That said, if you focus on the five things listed in this post I’m sure you’ll come out as a stronger developer by the end of the year.\n1. Using SwiftUI alongside UIKit (and vice versa)\n2. App Architecture\n3. Async-Await\n4. Core Data\n5. Accessibility", image: "ios"),
        article(title: "UMC Gachon iOS", content: "UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best.", image: "umc"),
        article(title: "Four apples 🍎🍎🍎🍎", content: "apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple", image: "apple_logo"),
        article(title: "Five things iOS developers should focus on in 2022", content: "In this short post I’ve listed five things that I believe will help you become a better developer in 2022. Or rather, the first half of 2022. I’m fully expecting Apple to release some cool new interesting things at this year’s WWDC that deserve some of your attention in the second half of the year. That said, if you focus on the five things listed in this post I’m sure you’ll come out as a stronger developer by the end of the year.\n1. Using SwiftUI alongside UIKit (and vice versa)\n2. App Architecture\n3. Async-Await\n4. Core Data\n5. Accessibility", image: "ios"),
        article(title: "UMC Gachon iOS", content: "UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best. UMC Gachon iOS is the best.", image: "umc"),
        article(title: "Four apples 🍎🍎🍎🍎", content: "apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple", image: "apple_logo")
    ]
}
