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
    var userInfo: UserInfo?
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Optional을 해지.
        // ?? "" -> sender.text가 nil이면 ""로 초기화 해주겠다는 뜻.
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
    
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 전달 받아서, 그것과 textField 데이터가 일치하면,
        // 로그인이 되어야 한다.
        
        // guard let을 이욯한 Optional 해제 방법.
        // 데이터가 있으면(nil이 아니면) 데이터를 선언, 없으면(nil이면) else 이후 코드 실행.
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email && userInfo.password == self.password {
            // 카테고리가 다른 두 화면을 보여줄 때 TabBar를 사용한다.
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            
            // 꽉찬 화면으로 변경.
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
        } else {
            
        }
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
        
        // 클로저를 통해 회원가입 데이터를 수신.
        // ARC -> 강한 참조 / 약한 참조
        // [weak self] -> 약한 참조 -> ARC를 낮춰줌
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    // 버튼에 속성을 설정하는 함수.
    func setupAttribute() {
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
