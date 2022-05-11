//
//  AppDelegate.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        // 네비게이션 컨트롤러를 생성해서 rootVC로 설정.
        let navController = UINavigationController()
        window?.rootViewController = navController
        
        // 현재 네비게이션 스택에 ViewController를 추가함.
        // viewControllers = The view controllers currently on the navigation stack.
        navController.viewControllers = [ViewController()]
        
        return true
    }

}

