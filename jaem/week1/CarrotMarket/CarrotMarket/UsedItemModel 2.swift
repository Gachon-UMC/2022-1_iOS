//
//  UsedItemModel.swift
//  CarrotMarket
//
//  Created by 서은수 on 2022/03/27.
//

import Foundation

// 중고 물품 데이터 저장.
struct UsedItemModel {

    // UsedItem 구조체의 배열인 UsedItems
    var usedItems: [UsedItem] = [
        // MARK: title, subdecription, price, imagePath를 각각 다르게 설정해주세요!!
        UsedItem(id: 0, title: "맥북 프로 13인치(8g/512g) 판매합니다. 실사용 굉장히 적습니다. 연락 주세요", subDescription: "서초1동 · 끌올 2시간 전", price: 70000000, imagePath: "MacBookPro"),
        UsedItem(id: 1, title: "새거나 다름 없는 가디건 팝니다!!", subDescription: "서초2동 · 끌올 4분 전", price: 15000, imagePath: "Cardigan"),
        UsedItem(id: 2, title: "자전거 싸게 드림", subDescription: "서초3동 · 끌올 10분 전", price: 81000, imagePath: "Bicycle"),
        UsedItem(id: 3, title: "갈축 키보드", subDescription: "서초4동 · 끌올 1분 전", price: 35000, imagePath: "Keyboard"),
        UsedItem(id: 4, title: "엑토르프 쇼파 2인용 커버 판매", subDescription: "서초2동 · 끌올 3분 전", price: 10000, imagePath: "SofaCover"),
        UsedItem(id: 5, title: "크롭 니트", subDescription: "서초3동 · 끌올 1분 전", price: 5000, imagePath: "CropKnit"),
        UsedItem(id: 6, title: "미개봉 아이맥 27 32GB 1TB 실버", subDescription: "서초1동 · 끌올 4분 전", price: 5100000, imagePath: "iMac"),
        UsedItem(id: 7, title: "숏 자켓", subDescription: "서초2동 · 끌올 1분 전", price: 10000, imagePath: "Jacket"),
        UsedItem(id: 8, title: "에어프라이어 팝니다. 5L", subDescription: "서초4동 · 끌올 6분 전", price: 25000, imagePath: "AirFryer")
        ]

    /* 이미지 출처
     id 0 : https://www.hellomarket.com/item/163348998
     1 : https://www.daangn.com/articles/357721558
     2 : https://www.dongdongmarket.com/?page_id=110&vid=43
     3 :  https://m.bunjang.co.kr/products/176514759?ref=%EA%B2%80%EC%83%89%EA%B2%B0%EA%B3%BC
     4 : https://m.bunjang.co.kr/products/179747011?original=1&content_owner=7905701
     5 : https://www.daangn.com/search/%ED%81%AC%EB%A1%AD%EB%8B%88%ED%8A%B8
     6 : https://m.bunjang.co.kr/search/products?q=%EC%95%84%EC%9D%B4%EB%A7%A5
     7 : https://m.bunjang.co.kr/products/173848983?ref=%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%EC%84%A0%ED%83%9D%EA%B2%B0%EA%B3%BC
     8 : https://www.daangn.com/articles/70192477
     */

    struct UsedItem : Identifiable {
        let id: Int
        let title: String
        let subDescription: String
        let price: Int
        let imagePath: String
        var isLiked: Bool = false
    }
   
}
