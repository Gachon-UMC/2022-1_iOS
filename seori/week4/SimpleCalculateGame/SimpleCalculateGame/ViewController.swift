//
//  ViewController.swift
//  SimpleCalculateGame
//
//  Created by 서은수 on 2022/04/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let titleLabel = UILabel()
    var startButton = UIButton()
    
    let questionNum = 0
    @IBOutlet weak var numPicker: UIPickerView!
    let maxQuestion = 20
    let minQuestion = 1
    
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
        
        startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    // picker view 설정
    // 한 row에 표시될 요소 갯수 설정.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    // row를 최대 몇 개까지 표시할 건지 설정.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxQuestion
    }
    
    // Picker view row마다 표시될 숫자 설정. + 흰색으로 표시되도록 attributedTitleForRow 형식으로 사용.
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: String(row + 1), attributes: [.foregroundColor: UIColor.white])
    }
    
    // 시작 버튼 누르면 문제 화면으로 넘어가도록.
    @objc
    func startButtonDidTap() {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewControllerID")

        self.navigationController?.pushViewController(pushVC!, animated: true)
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
