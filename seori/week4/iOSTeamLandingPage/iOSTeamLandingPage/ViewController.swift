//
//  ViewController.swift
//  iOSTeamLandingPage
//
//  Created by 서은수 on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {

    // navigation bar item으로 넣을 이미지 설정. (umc 로고)
    var umcImage: UIImageView = {
        let umcImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        umcImage.image = UIImage(named: "image_1")
        umcImage.contentMode = .scaleAspectFit
        return umcImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar 세팅.
        setNavigationBar()
    }

    // navigation bar 세팅.
    func setNavigationBar() {
        // leftBarButtonItem을 umcImage로 설정.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: umcImage)
        
        // 색깔 설정.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .black
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        // 스크롤 했을 때도 색깔이 똑같이 black으로 보이도록 설정.
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}

