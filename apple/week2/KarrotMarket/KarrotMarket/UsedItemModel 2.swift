//
//  UsedItemModel.swift
//  KarrotMarket
//
//  Created by 조동진 on 2022/03/28.
//

import Foundation

struct UsedItemModel {

    var usedItems: [UsedItem] = [
        // MARK: title, subdecription, price, imagePath를 각각 다르게 설정해주세요!!
      UsedItem(id: 0, title: "맥북프로 13인치아아아안아난암나이나아ㅣㄴ아ㅣㅏ이ㅏㅣ나이망", subDescription: "복산동 · 끌올 10분 전", price: "1,000,000원", imagePath: "image1"),
        UsedItem(id: 1, title: "아이패드 프로 12.9", subDescription: "반구동 · 끌올 1분 전", price: "800,000원", imagePath: "image2"),
        UsedItem(id: 2, title: "아이폰13 프로", subDescription: "서동 · 끌올 31분 전", price: "900,000원", imagePath: "image3"),
        UsedItem(id: 3, title: "에어팟 프로", subDescription: "성안동 · 끌올 40분 전", price: "200,000원", imagePath: "image4"),
        UsedItem(id: 4, title: "아이맥 미개봉", subDescription: "무거동 · 끌올 27분 전", price: "1,300,000원", imagePath: "image5"),
        UsedItem(id: 5, title: "애플 헤드셋", subDescription: "야음동 · 끌올 18분 전", price: "300,000원", imagePath: "image6"),
        UsedItem(id: 6, title: "애플TV", subDescription: "다운동 · 끌올 45분 전", price: "500,000원", imagePath: "image7"),
        UsedItem(id: 7, title: "아이폰 하드케이스", subDescription: "달동 · 끌올 2분 전", price: "15,000원", imagePath: "image8"),
        UsedItem(id: 8, title: "애플 매직 마우스", subDescription: "신청동 · 끌올 30분 전", price: "150,000원", imagePath: "image9")
    ]

    struct UsedItem : Identifiable {
        let id: Int
        let title: String
        let subDescription: String
        let price: String
        let imagePath: String
        var isLiked: Bool = false
    }

}
