//
//  MenuModel.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import Foundation

struct MenuModel{
    
    var menuList: [Menu] = [
        Menu(title: "Vehicle 🏎 🚌 🚐 🛴 🛵 ", isSelected: false),
        Menu(title: "Face 😃 😇 🤗 🤑 😋 😙 ", isSelected: false),
        Menu(title: "Animal 🐷 🐰 🐨 🦁 🙊 ", isSelected: false),
        Menu(title: "Fruit 🍇 🍈 🍉 🍌 🥝 🍒", isSelected: false)
    ]
    
    mutating func selectMenu(index: Int){
        menuList[index].isSelected = !menuList[index].isSelected
        
        for i in 0..<menuList.count{
            if(i != index){
                menuList[i].isSelected = false
            }
        }
    }
    
    struct Menu{
        var title: String
        var isSelected: Bool
    }
}
