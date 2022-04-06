//
//  SecondViewController.swift
//  SimpleCalculateGame
//
//  Created by 서은수 on 2022/04/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var answerField: UITextField!
    
    var rightBarButton: UIBarButtonItem!
    var customView = UIView()
    var correctQuestionNum = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField의 placeholder 색깔 커스텀.
        answerField.attributedPlaceholder = NSAttributedString(string: "정답", attributes: [.foregroundColor: UIColor.lightGray])
        
        customRightBarButton()
        addLabel()
    }
    
    // 이전 화면으로 돌아가도록.
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 오른쪽 상단의 문제 횟수 Indicator(= bar button item) 커스텀.
    func customRightBarButton() {
        // 커스텀뷰의 레이아웃 설정.
        view.addSubview(customView)
        customView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // 커스텀뷰 속성 설정.
        customView.tintColor = UIColor(named: "mainColor2")
        customView.backgroundColor = UIColor(named: "mainColor2")
        customView.cornerRadius = 18
        
        // 커스텀뷰를 right bar button item으로 설정.
        rightBarButton = UIBarButtonItem.init(customView: customView)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // 커스텀뷰 안에 label을 추가.
    func addLabel() {
        // 맞힌 문제의 갯수를 알려줄 label의 속성을 설정.
        correctQuestionNum.text = "1/4"
        correctQuestionNum.font = UIFont.systemFont(ofSize: 15)
        correctQuestionNum.textColor = UIColor.white
        
        // label을 서브뷰로 추가하고 레이아웃 설정.
        customView.addSubview(correctQuestionNum)
        
        correctQuestionNum.translatesAutoresizingMaskIntoConstraints = false
        
        correctQuestionNum.centerXAnchor.constraint(equalTo: customView.centerXAnchor, constant: 0).isActive = true
        correctQuestionNum.centerYAnchor.constraint(equalTo: customView.centerYAnchor, constant: 0).isActive = true
    }
}
