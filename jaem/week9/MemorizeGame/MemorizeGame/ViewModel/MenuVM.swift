//
//  MenuVM.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/05/26.
//

import UIKit

class MenuVM: ObservableObject{
    @Published public var model = MenuModel()
    typealias Menu = MenuModel.Menu
    
    func getMenuList() -> [Menu]{
        return model.menuList
    }
    
    func selectMenu(index: Int){
        model.selectMenu(index: index)
    }
}
