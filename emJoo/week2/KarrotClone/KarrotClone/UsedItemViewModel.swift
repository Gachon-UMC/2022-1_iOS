//
//  UsedItemViewModel.swift
//  KarrotClone
//
//  Created by 이해주 on 2022/03/30.
//

import Foundation

struct UsedItemViewModel {
    
    var model: UsedItemModel = UsedItemModel()
    typealias UsedItem = UsedItemModel.UsedItem
    
    var items: [UsedItem] {
        model.usedItems
    }
    
    func toggleLiked(_ index: Int) {

    }
}

