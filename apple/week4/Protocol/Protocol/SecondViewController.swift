//
//  SecondViewController.swift
//  Protocol
//
//  Created by 조동진 on 2022/04/02.
//

import UIKit

// 첫 번째 ViewController에서 정의한 Protocol을 채택하여 메서드 준수
class SecondViewController: UIViewController, ChangeLabelDelegate {
  // 기능 정의
  func doChange() {
    self.previousViewController?.label.text = self.textField.text
  }
  
  
  // 이전의 ViewController
  var previousViewController: ViewController?
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // previousViewController의 Delegate를 위임 받음을 명시
    previousViewController?.delegate = self
  }
  
  @IBAction func buttonDismiss(_ sender: UIButton) {
    // 기능 사용
    doChange()
    dismiss(animated: true, completion: nil)
  }
  
  
}

// Protocol의 기능을 SecondViewController가 위임 받아서 첫 번째 ViewController의 Label을 change
