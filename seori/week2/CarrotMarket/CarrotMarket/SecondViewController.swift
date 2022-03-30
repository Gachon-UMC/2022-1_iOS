//
//  SecondViewController.swift
//  CarrotMarket
//
//  Created by 서은수 on 2022/03/30.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    let titleLabel = UILabel()
    let backBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavi()
    }
    
    // navigation bar 초기화.
    func initNavi() {
        // title의 label 설정.
        titleLabel.text = "관심 목록"
        navigationItem.titleView = titleLabel
        
        // back button의 이미지, 색깔 설정.
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrow.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow.backward")
        navigationController?.navigationBar.tintColor = .label
        
        // Back이라고 적힌 title 제거.
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}
