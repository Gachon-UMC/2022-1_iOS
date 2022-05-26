//
//  RegisterViewController.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/03/27.
//

import UIKit

class RegisterViewController: UIViewController {
  // MARK: - Properties
  var email: String = ""
  var name: String = ""
  var nickname: String = ""
  var password: String = ""
  
  var userInfo: ((UserInfo) -> Void)?
  
  // 유효성 검사
  var isValidEmail = false {
    didSet { // 프로퍼티 옵저버 (프로퍼티 값 변경 시 동작)
      self.validateUserInfo()
    }
  }
  var isValidName = false {
    didSet {
      self.validateUserInfo()
    }
  }
  var isValidNickname = false {
    didSet {
      self.validateUserInfo()
    }
  }
  var isValidPassword = false {
    didSet {
      self.validateUserInfo()
    }
  }
  
  // TextFields
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nicknameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signupButton: UIButton!
  @IBOutlet weak var popToLoginButton: UIButton!

  // 연산 프로퍼티
  var textFields: [UITextField] {
    [emailTextField, nameTextField, nicknameTextField, passwordTextField]
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTextField()
    setupAttribute()
    
    // bug fix -> left swipe gesture
    self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
  }
  
  // MARK: - Actions
  @objc
  func textFieldEditingChanged(_ sender: UITextField) {
    let text = sender.text ?? ""
    
    switch sender {
    case emailTextField:
      self.isValidEmail = text.isValidEmail() // extention method
      self.email = text
      
    case nameTextField:
      self.isValidName = text.count > 2
      self.name = text
      
    case nicknameTextField:
      self.isValidNickname = text.count > 2
      self.nickname = text
      
    case passwordTextField:
      self.isValidPassword = text.isValidPassword()
      self.password = text
      
    default:
      fatalError("Missing TextField...") // 앱 종료
    }
  }
  
  @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
    // 뒤로가기
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func registerButtonDidTap(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    
    let userInfo = UserInfo(
      email: self.email,
      name: self.name,
      nickname: self.nickname,
      password: self.password)
    
    self.userInfo?(userInfo)
  }
  
  
  
  
  
  // MARK: - Helpers
  private func setupTextField() {
    
    textFields.forEach { tf in
      tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    
    
  }
  
  // 사용자가 입력한 회원정보를 확인 -> UI 업데이트
  private func validateUserInfo() {
    if isValidEmail && isValidName && isValidNickname && isValidPassword {
      self.signupButton.isEnabled = true
      
      UIView.animate(withDuration: 0.33) {
        self.signupButton.backgroundColor = UIColor.facebookColor
      }
    } else {
      self.signupButton.isEnabled = false
      
      UIView.animate(withDuration: 0.33) {
        self.signupButton.backgroundColor = UIColor.disabledButtonColor
      }
    }
    
  }
  
  private func setupAttribute() {
    let text1 = "계정이 있으신가요?"
    let text2 = "로그인"
    
    let font1 = UIFont.systemFont(ofSize: 13)
    let font2 = UIFont.boldSystemFont(ofSize: 13)
    
    let color1 = UIColor.darkGray
    let color2 = UIColor.facebookColor
    
    let attributes = generateButtonAttribute(
      self.popToLoginButton,
      texts: text1, text2,
      fonts: font1, font2,
      colors: color1, color2)
    
    self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
  }
  
}



// 정규표현식
extension String {
  // password 유효성 검사: 대문자, 소문자, 특수문자, 숫자, 8자 이상일 때 -> true
  func isValidPassword() -> Bool {
    let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
    let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
    
    return passwordValidation.evaluate(with: self)
  }
  
  // email 유효성 검사: @, 2자 이상일 때 -> true
  func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
    return emailTest.evaluate(with: self)
  }
}
