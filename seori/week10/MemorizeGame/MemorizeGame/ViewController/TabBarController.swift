//
//  TabBarController.swift
//  MemorizeGame
//
//  Created by 서은수 on 2022/05/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First, remove the default top line and background
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()

        // Then, add the custom top line view with custom color. And set the default background color of tabbar
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        lineView.backgroundColor = UIColor.lightGray
        
        tabBar.addSubview(lineView)     // 그냥 view에 addSubview를 하는 게 아니라 tabBar에 addSubview를 해야 한다 !!
    }
    
    override func viewDidLayoutSubviews() {
        // tabBar 높이 설정.
        tabBar.bounds.size.height = 90
    }
}
