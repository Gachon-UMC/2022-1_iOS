//
//  SecondViewController.swift
//  CalculateGame
//
//  Created by 조동진 on 2022/04/06.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var subView: UIView!
  
  // data from previous view
  var level: Float = 0 // 0.0 ~ 4.0
  var numOfQuestion: Int = 0 // 0 ~ 19
  var numOfclear: Int = 0 // UserDefaults
  
  var numOfSolve: Int = 0
  
  var operand1 = 0
  var operand2 = 0
  var operand3 = 0
  var operator1 = 0 // range: 0~3  ->  + - * /
  var operator2 = 0
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // radius config
    subView.layer.cornerRadius = 10
    
    // textField config
    answerTextField.attributedPlaceholder = NSAttributedString(string: "정답", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
    
    // create queestion
    createQuestion()
    
    // textField delegate
    self.answerTextField.delegate = self
    
    // navigation bar back button config
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.topItem?.title = ""
    self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
    self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
    
    // barButtonItem config
    self.configBarButtonItem()
  }
  
  func configBarButtonItem() {
    let label = UILabel()
    label.textColor = .white
    label.text = String(numOfSolve) + "/" + String(numOfQuestion)

    let stackView = UIStackView(arrangedSubviews: [label])
    stackView.backgroundColor = .systemGray
    stackView.layer.cornerRadius = 13

    let barButtonItem = UIBarButtonItem(customView: stackView)
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  func createQuestion() {
    switch Int(level) {
    case 0:
      operand1 = Int.random(in: 0...9)
      operand2 = Int.random(in: 0...9)
      questionLabel.text = String(operand1) + " + " + String(operand2)
    case 1:
      operand1 = Int.random(in: 10...99)
      operand1 = Int.random(in: 0...9)
      questionLabel.text = String(operand1) + " + " + String(operand2)
    case 2:
      operand1 = Int.random(in: 10...99)
      operand2 = Int.random(in: 10...99)
      questionLabel.text = String(operand1) + " + " + String(operand2)
    case 3:
      operand1 = Int.random(in: 10...99)
      operand2 = Int.random(in: 10...99)
      operand3 = Int.random(in: 10...99)
      questionLabel.text = String(operand1) + " + " + String(operand2) + " + " + String(operand3)
    case 4:
      operand1 = Int.random(in: 10...99)
      operand2 = Int.random(in: 10...99)
      operand3 = Int.random(in: 10...99)
      operator1 = Int.random(in: 0...3)
      switch operator1 {
      case 0:
        questionLabel.text = String(operand1) + " + " + "(" + String(operand2) + " + " + String(operand3) + ")"
      case 1:
        questionLabel.text = String(operand1) + " - " + "(" + String(operand2) + " + " + String(operand3) + ")"
      case 2:
        questionLabel.text = String(operand1) + " X " + "(" + String(operand2) + " + " + String(operand3) + ")"
      case 3:
        questionLabel.text = String(operand1) + " / " + "(" + String(operand2) + " + " + String(operand3) + ")"
      default:
        return
      }
    default:
      return
    }
  }
  
  func rightAnswer() {
    self.answerTextField.text = ""
    numOfSolve += 1
    self.createQuestion()
    
    if numOfSolve == numOfQuestion {
      numOfclear += 1
      NotificationCenter.default.post(name: Notification.Name("numOfClear"), object: numOfclear)
      
      let alert = UIAlertController(title: "성공", message: "Game Clear!", preferredStyle: UIAlertController.Style.alert)
      let action = UIAlertAction(title: "확인", style: .default) { (action) in
        self.navigationController?.popViewController(animated: true)
      }
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    }
  }
  
  func wrongAnswer() {
    answerTextField.text = ""
    
    let alert = UIAlertController(title: "실패", message: "틀렸습니다", preferredStyle: UIAlertController.Style.alert)
    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}

extension SecondViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == self.answerTextField {
      print("in works")
      switch level {
      case 0:
        if Int(answerTextField.text ?? "") == operand1 + operand2 {
          self.rightAnswer()
        } else {
          wrongAnswer()
        }
      case 1:
        if Int(answerTextField.text ?? "") == operand1 + operand2 {
          self.rightAnswer()
        } else {
          wrongAnswer()
        }
      case 2:
        if Int(answerTextField.text ?? "") == operand1 + operand2 {
          self.rightAnswer()
        } else {
          wrongAnswer()
        }
      case 3:
        if Int(answerTextField.text ?? "") == operand1 + operand2 + operand3 {
          self.rightAnswer()
        } else {
          wrongAnswer()
        }
      case 4:
        switch operator1 {
        case 0:
          print(operand1 + operand2 + operand3)
          if Int(answerTextField.text ?? "") == operand1 + operand2 + operand3 {
            self.rightAnswer()
          } else {
            wrongAnswer()
          }
        case 1:
          let operand = operand2 + operand3
          print(operand1 - operand)
          if Int(answerTextField.text!) == operand1 - operand { // 음수 처리를 위한 바인딩
            self.rightAnswer()
          } else {
            wrongAnswer()
          }
        case 2:
          let operand = operand2 + operand3
          print(operand1 * operand)
          if Int(answerTextField.text ?? "") == operand1 * operand {
            self.rightAnswer()
          } else {
            wrongAnswer()
          }
        case 3:
          let operand = operand2 + operand3
          print(operand1 / operand)
          if Int(answerTextField.text ?? "") == operand1 / operand  {
            self.rightAnswer()
          } else {
            wrongAnswer()
          }
        default:
          return true
        }
      default:
        return true
      }
    }
    
    return true
  }
}
