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
    
    var level = Int(3)
    var questionNum = Int(1)
    
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var levelExample: UILabel!
    
    @IBOutlet weak var numPicker: UIPickerView!
    let maxQuestion = 20
    let minQuestion = 1
    
    // 게임 완료 횟수.
    @IBOutlet weak var gameCompletedNumLabel: UILabel!
    var gameCompletedNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavi()
    }
    
    // 네비게이션 바 초기화
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
        
        startButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: startButton)
        
        startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    
    // Slider로 난이도 조정.
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if sender.value < 1 {
            levelName.text = "🙂 매우 쉬움"
            levelExample.text = "3 + 4 = ?"
        } else if sender.value < 2 {
            levelName.text = "😎 쉬움"
            levelExample.text = "14 + 2 = ?"
        } else if sender.value < 3 {
            levelName.text = "🙂 보통"
            levelExample.text = "23 + 17 = ?"
        } else if sender.value < 4 {
            levelName.text = "🙁 어려움"
            levelExample.text = "42 + 23 + 34 = ?"
        } else if sender.value < 5 {
            levelName.text = "😱 매우 어려움"
            levelExample.text = "(72X6) + 32 = ?"
        }
        
        // 게임 난이도 설정.
        level = Int(ceil(sender.value))
    }
    
    // 시작 버튼 누르면 문제 화면으로 넘어가도록.
    @objc
    func startButtonDidTap() {
        // 전달할 데이터 생성.
        let game = Game(level: self.level, questionNum: self.questionNum, question: [], answer: [], currentStage: 1)
        
        guard let gameVC = self.storyboard?.instantiateViewController(identifier: "secondViewControllerID") as? SecondViewController else { return }
        
        // 전달하고 화면 전환.
        gameVC.game = game
        gameVC.gameCompletedNum = gameCompletedNum
        
        // mainVC로 다시 돌아올 때 데이터를 전달 받아서 업데이트 하기 위해.
        gameVC.sendGameCompletedNum = { (gameCompletedNum: Int) in
            self.gameCompletedNum = gameCompletedNum
            self.gameCompletedNumLabel.text = String(self.gameCompletedNum)
        }
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    
    // 선택된 row로 게임 문제 갯수 설정.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        questionNum = row + 1
    }
}
