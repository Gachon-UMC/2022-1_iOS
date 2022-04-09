//
//  SecondViewController.swift
//  Protocol
//
//  Created by 서은수 on 2022/04/09.
//

import UIKit

// 2. ChangeLabelDelegate를 위임.
class SecondViewController: UIViewController, ChangeLabelDelegate {
    // 3. 프로토콜 기능 구현.
    func doChange() {
        previousVC?.label.text = textField.text
    }

    @IBOutlet weak var textField: UITextField!
    
    // 1. 이전 VC를 변수로 선언.
    var previousVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. delegate 기능을 내가 위임받겠다! 알려주는 것.
        previousVC?.delegate = self
    }

    // 버튼을 누르면 데이터를 전달하고 이전 화면으로 돌아가도록.
    @IBAction func buttonDismiss(_ sender: UIButton) {
        // 버튼을 눌렀을 때 데이터를 전달.
        doChange()
        
        // modal 방식으로 present됐던 VC를 dismiss 시킨다.
        dismiss(animated: true, completion: nil)
    }
    

}
