//
//  CategoryModel.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import Foundation

class CategoryModel {
    
    // MARK: - Properties
    
    struct Model {
        let category: String!
    }
    
    private var categories = [
        Model(category: "Vehicle 🏎 🚌 🚐 🛴 🛵 🚗"),
        Model(category: "Face 😃 😇 🤗 🤑 😋 😙"),
        Model(category: "Animal 🐷 🐰 🐨 🦁 🙊 🐱"),
        Model(category: "Fruit 🍇 🍈 🍉 🍒 🍌 🥝")
    ]
    
    // MARK: - Functions
    
    public func getCategory(_ index: Int) -> String {
        categories[index].category
    }
    
    public func getCounts() -> Int {
        categories.count
    }
}
