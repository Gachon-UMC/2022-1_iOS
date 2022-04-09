//
//  ViewController.swift
//  Protocol
//
//  Created by 서은수 on 2022/04/09.
//

import UIKit

// 1. 프로토콜 생성.
protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    // 2. 이곳에서는 프로토콜을 정의만 해준다.
    var delegate: ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 버튼을 누르면 다음 화면으로 넘어가도록.
    @IBAction func buttonGoNextVC(_ sender: UIButton) {
        // 다음 VC를 정의한다.
        guard let nextVC = storyboard?.instantiateViewController(identifier: "secondVC") as? SecondViewController else {
            return
        }
        
        // 전체가 꽉찬 화면으로 전환되도록 설정.
        nextVC.modalPresentationStyle = .fullScreen
        // 3. 다음 VC에서 정의한 previousVC가 바로 나다! 를 알리는 것.
        nextVC.previousVC = self
        
        // 다음 VC를 보여준다.
        present(nextVC, animated: true, completion: nil)
    }
    
}

