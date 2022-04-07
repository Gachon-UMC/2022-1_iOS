//
//  SecondViewController.swift
//  SimpleCalculateGame
//
//  Created by 서은수 on 2022/04/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    var rightBarButton: UIBarButtonItem!
    var customView = UIView()
    var correctQuestionNum = UILabel()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    
    // 게임 옵션값 수신을 위한 구조체 선언.
    var game: Game!
    
    // 게임 문제 설정할 때 필요한 값들.
    let unitsRange: Range<Int> = 1..<10
    let tensRange: Range<Int> = 10..<100
    var firstNum: Int = Int(0)
    var secondNum: Int = Int(0)
    var thirdNum: Int = Int(0)
    
    // 게임 완료 횟수 (Int)
    var gameCompletedNum: Int = 0
    var sendGameCompletedNum: ((_ gameCompletedNum: Int)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField의 placeholder 색깔 커스텀.
        answerField.attributedPlaceholder = NSAttributedString(string: "정답", attributes: [.foregroundColor: UIColor.lightGray])
        
        customRightBarButton()
        addLabel()
        
        gameSetup(game: &game)
        self.addDoneButtonOnKeyboard()
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
        correctQuestionNum.text = String(game.currentStage) + "/" + String(game.questionNum)
        correctQuestionNum.font = UIFont.systemFont(ofSize: 15)
        correctQuestionNum.textColor = UIColor.white
        
        // label을 서브뷰로 추가하고 레이아웃 설정.
        customView.addSubview(correctQuestionNum)
        
        correctQuestionNum.translatesAutoresizingMaskIntoConstraints = false
        
        correctQuestionNum.centerXAnchor.constraint(equalTo: customView.centerXAnchor, constant: 0).isActive = true
        correctQuestionNum.centerYAnchor.constraint(equalTo: customView.centerYAnchor, constant: 0).isActive = true
    }
    
    // 난이도에 따른 게임 문제, 답 설정.
    func gameSetup(game: inout Game) {
        print(game.questionNum)
        
        for _ in 0...game.questionNum - 1 {
            switch game.level {
            case 1:
                firstNum = Int.random(in: unitsRange)
                secondNum = Int.random(in: unitsRange)
                game.answer.append(String(firstNum + secondNum))
                game.question.append(String(firstNum) + " + " + String(secondNum))
            case 2:
                firstNum = Int.random(in: tensRange)
                secondNum = Int.random(in: unitsRange)
                game.answer.append(String(firstNum + secondNum))
                game.question.append(String(firstNum) + " + " + String(secondNum))
            case 3:
                firstNum = Int.random(in: tensRange)
                secondNum = Int.random(in: tensRange)
                game.answer.append(String(firstNum + secondNum))
                game.question.append(String(firstNum) + " + " + String(secondNum))
            case 4:
                firstNum = Int.random(in: tensRange)
                secondNum = Int.random(in: tensRange)
                thirdNum = Int.random(in: tensRange)
                game.answer.append(String(firstNum + secondNum + thirdNum))
                game.question.append(String(firstNum) + " + " + String(secondNum) + " + " + String(thirdNum))
            case 5:
                firstNum = Int.random(in: tensRange)
                secondNum = Int.random(in: unitsRange)
                thirdNum = Int.random(in: tensRange)
                game.answer.append(String(firstNum * secondNum + thirdNum))
                game.question.append(String(firstNum) + " x " + String(secondNum) + " + " + String(thirdNum))
            default:
                game.question = []
            }
        }
        
        questionLabel.text = game.question[game.currentStage - 1]
        
        print(game.question)
        print(game.answer)
    }
    
    // Done 버튼 추가.
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        answerField.inputAccessoryView = doneToolbar
    }

    // Done 버튼 액션 설정.
    @objc func doneButtonAction(){
        answerField.resignFirstResponder()
        
        if game.answer[game.currentStage - 1] == answerField.text {
            correctQuestionNum.text = String(game.currentStage) + "/" + String(game.questionNum)
            print("right")
            
            if game.currentStage == game.questionNum {
                // 완성 alert 띄우기.
                addAlert()
            } else {
                // 다음 문제로 변경.
                game.currentStage += 1
                questionLabel.text = game.question[game.currentStage - 1]
                
                correctQuestionNum.text = String(game.currentStage) + "/" + String(game.questionNum)
                
                // 텍스트 필드 초기화.
                answerField.text = ""
            }
        } else { answerField.text = "" }
    }
    
    // 게임이 완료됐을 때 띄울 alert 정의.
    func addAlert() {
        let alert = UIAlertController(title: "성공", message: "", preferredStyle: .alert)
        
        // alert 뜨고 확인 클릭했을 때 실행할 코드.
        let alertAction = UIAlertAction(title: "확인", style: .default) { [self] _ in
            
            // 게임 완료 횟수 업데이트 후 mainVC로 데이터 전송.
            gameCompletedNum += 1
            sendGameCompletedNum?(gameCompletedNum)
            
            // mainVC로 화면 전환.
            self.navigationController?.popViewController(animated: true)
        }
        
        // 확인 버튼 색 변경.
        alertAction.setValue(UIColor.label, forKey: "titleTextColor")
        
        alert.addAction(alertAction)
        present(alert, animated: false, completion: nil)
    }
}
