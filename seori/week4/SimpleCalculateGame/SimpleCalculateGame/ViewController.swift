//
//  ViewController.swift
//  SimpleCalculateGame
//
//  Created by 서은수 on 2022/04/05.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    var startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavi()
    }

    
    func initNavi() {
        view.backgroundColor = UIColor(named: "mainColor1")
        
        // title 설정
        titleLabel.text = "설정"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        // 시작 버튼 설정
        startButton.backgroundColor = UIColor(named: "mainColor2")
        startButton.layer.cornerRadius = 18
        startButton.setTitle("시작", for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        // startButton.translatesAutoresizingMaskIntoConstraints = false -> 안 써도 되는 건가???
        startButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: startButton)
    }
    
    
}

// UIView의 기능 확장.
extension UIView {
    // 모서리를 둥글게!
    // @IBInspectable -> 해당 변수를 IB의 인스펙터로 사용할 수 있다는 뜻.
    // 인스펙터에 cornerRadius 항목이 추가됨.
    @IBInspectable var cornerRadius: CGFloat {
        // get과 set으로 연산 프로퍼티를 정의한 것.
        // 값을 가져올 때.
        get {
            return layer.cornerRadius
        }
        // 값을 세팅할 때.
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
