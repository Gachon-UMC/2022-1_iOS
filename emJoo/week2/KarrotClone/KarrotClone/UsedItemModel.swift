//
//  UsedItemModel.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import Foundation

import Foundation


struct UsedItemModel {

    var usedItems: [UsedItem] = [
        // MARK: title, subdecription, price, imagePath를 각각 다르게 설정해주세요!!
        UsedItem(id: 0, title: "중고 물품1, 중고 물품1, 중고 물품1, 중고 물품1, 중고 물품1", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image1"),
        UsedItem(id: 1, title: "중고 물품2", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image2"),
        UsedItem(id: 2, title: "중고 물품3", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image3"),
        UsedItem(id: 3, title: "중고 물품4", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image4"),
        UsedItem(id: 4, title: "중고 물품5", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image5"),
        UsedItem(id: 5, title: "중고 물품6", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image6"),
        UsedItem(id: 6, title: "중고 물품7", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image7"),
        UsedItem(id: 7, title: "중고 물품8", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image8"),
        UsedItem(id: 8, title: "중고 물품8", subDescription: "서초4동 · 끌올 1분 전", price: 400000, imagePath: "image9")
    
    
    ]




    struct UsedItem : Identifiable {
        var id: Int
        var title: String
        var subDescription: String
        var price: Int
        var imagePath: String
        var isLiked: Bool = false
    }

    
    

}



