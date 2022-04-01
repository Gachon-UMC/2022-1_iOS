//
//  LoginViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/01.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Optional을 해지.
        // ?? "" -> sender.text가 nil이면 ""로 초기화 해주겠다는 뜻.
        email = sender.text ?? ""
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면 전환
        // 1. 스토리보드를 생성 -> Main은 사실 이렇게 변수로 안 만들어도 이용 가능
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용하여 화면을 전환
        // 아래에서 위로 화면이 올라오는 방법
//        self.present(registerViewController, animated: true, completion: nil)
        // 오른쪽에서 왼쪽으로 화면이 나오는 방법
        // 더 상세한 내용으로(수직적인 구조) 넘어갈 때 네비게이션 컨트롤러를 주로 사용한다.
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    
}
