//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/03/27.
//

import UIKit

class LoginViewController: UIViewController {

  var email = String()
  var password = String()
  var userInfo: UserInfo?
  
  @IBOutlet weak var registerButton: UIButton!
  @IBOutlet weak var loginButton: UIButton!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }

 
  @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
    let text = sender.text ?? "" // 옵셔널 반환, 값이 없을 경우 ""로 할당
    
    self.loginButton.backgroundColor = text.isValidEmail()
    ? .facebookColor : .disabledButtonColor
    
    self.email = text
  }
  
  @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
    let text = sender.text ?? ""
    
    self.loginButton.backgroundColor = text.count > 2
    && self.email.isValidEmail()
    ? .facebookColor : .disabledButtonColor
    
    self.password = text
  }
  
  @IBAction func loginButtonDidTap(_ sender: UIButton) {
    // RegisterViewController에서 UserInfo 받아서 이메일, 비밀번호 확인하여 로그인
    guard let userInfo = self.userInfo else { return }
    if userInfo.email == self.email
        && userInfo.password == self.password {
      let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
      
//      vc.modalPresentationStyle = .fullScreen
//      self.present(vc, animated: true, completion: nil)
      self.view.window?.windowScene?.keyWindow?.rootViewController = vc
    }
  }
  
  @IBAction func registerButtonDidTap(_ sender: UIButton) {
    // 화면 전환
    // 1. 스토리보드 생성 (Main 스토리보드의 경우 자동으로 생성됨)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    // 2. 뷰 컨트롤러 생성
    let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController // Down casting
    
    // 3. 화면 전환 메서드를 이용
//    self.present(registerViewController, animated: true, completion: nil) // registerVC로 전환
    self.navigationController?.pushViewController(registerViewController, animated: true)
    
    // RegisterViewController로부터 데이터 받아오기
    registerViewController.userInfo = { [weak self] (userInfo) in
      self?.userInfo = userInfo
    }
  }
  
  private func setupAttribute() {
    let text1 = "계정이 없으신가요?"
    let text2 = "가입하기"
    
    let font1 = UIFont.systemFont(ofSize: 13)
    let font2 = UIFont.boldSystemFont(ofSize: 13)
    
    let color1 = UIColor.darkGray
    let color2 = UIColor.facebookColor
    
    let attributes = generateButtonAttribute(
      self.registerButton,
      texts: text1, text2,
      fonts: font1, font2,
      colors: color1, color2)
    
    self.registerButton.setAttributedTitle(attributes, for: .normal)
  }
}
