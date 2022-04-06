//
//  ViewController.swift
//  Protocol
//
//  Created by 조동진 on 2022/04/02.
//

import UIKit

// 1. Protocol 정의
protocol ChangeLabelDelegate {
  func doChange()
}

class ViewController: UIViewController {
  
  var delegate: ChangeLabelDelegate?

  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func buttonGoNextVC(_ sender: UIButton) {
    guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
    
    // SecondViewController의 previousViewController가 자신임을 알림
    nextVC.previousViewController = self
    
    // modal style config
    nextVC.modalPresentationStyle = .fullScreen
    self.present(nextVC, animated: true, completion: nil)
  }
  
}

