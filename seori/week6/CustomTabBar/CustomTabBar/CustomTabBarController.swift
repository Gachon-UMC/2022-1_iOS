//
//  CustomTabBarController.swift
//  CustomTabBar
//
//  Created by 서은수 on 2022/04/29.
//

import UIKit

class CustomTabBarController: UITabBarController {

    // 탭 바의 가운데 부분에 위치할 이미지뷰 생성.
    lazy var centerTabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "flag.and.flag.filled.crossed")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "pointColor")
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭 바 설정.
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        // 탭 바의 높이 설정.
        tabBar.bounds.size.height = 100
        
        // 이미지뷰 레이아웃 설정.
        view.addSubview(centerTabImageView)
        NSLayoutConstraint.activate([
            centerTabImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerTabImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            centerTabImageView.widthAnchor.constraint(equalToConstant: 70),
            centerTabImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    // 탭 바 설정.
    func setupTabBar() {
        // 탭 바 모서리 둥글게 설정.
        self.tabBar.layer.cornerRadius = 20
        
        // 탭 바의 그림자 설정.
        // 1. 기본 그림자 스타일 초기화.
        UITabBar.clearShadow()
        // 2. 탭 바에 그림자(커스텀 스타일)를 적용.
        tabBar.layer.applyShadow(color: .gray, alpha: 0.4, x: 0, y: 0, blur: 12)
        
        // 이미지뷰에 그림자 적용.
        centerTabImageView.layer.applyShadow(color: .gray, alpha: 0.5, x: 0, y: 0, blur: 12)
    }
}

extension CALayer {
    // Sketch 스타일의 그림자를 생성하는 유틸리티 함수.
    // 파라미터의 기본값을 설정해 준 형태 -> 인자값이 안 들어와도 실행 가능.
    func applyShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있다.
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
