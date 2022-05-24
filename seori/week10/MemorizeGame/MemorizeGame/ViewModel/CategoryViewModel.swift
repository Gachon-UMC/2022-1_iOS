//
//  CategoryViewModel.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import Foundation

class CategoryViewModel {
    
    // MARK: - Properties
    
    @Published private var model = CategoryModel()
    
    typealias Category = CategoryModel.Model
    
    // MARK: - Functions
    
    public func getCategory(_ index: Int) -> String {
        model.getCategory(index)
    }
    
    public func getCounts() -> Int {
        model.getCounts()
    }
}
