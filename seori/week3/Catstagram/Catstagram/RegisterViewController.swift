//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    // text field에서 입력한 값을 멤버 변수로 받는다.
    var email: String = ""
    var name: String = ""
    var nickName: String = ""
    var password: String = ""
    
    // 클로저 선언.
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성 검사를 위한 프로퍼티.
    var isValidEmail = false {
        didSet {    // 프로퍼티 옵저버. didSet : 셋팅 후에 해당 코드 블럭을 실행하겠다.
            self.validateUserInfo() // isValidEmail에 값이 입력될 때마다 이 메소드가 호출된다.
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var popToLoginButton: UIButton!
    
    // TextFields.
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // 연산 프로퍼티.
    var textFields: [UITextField] {
        [emailTextField, passwordTextField, nameTextField, nickNameTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupAttribute()
        
        // bug fix -> 스와이프를 통한 뒤로가기.
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    // Text Field의 값이 바뀔 때마다 실행되는 함수.
    // @IBAction을 쓰지 않고 액션을 코드로 구현하는 방법 -> @objc를 사용한다.
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""  // 초기화로 Optional 해제.
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            self.nickName = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 이전화면으로 돌아가기 (뒤로가기)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        // 이전화면으로 돌아가기 (뒤로가기)
        self.navigationController?.popViewController(animated: true)
        
        // 구조체 생성.
        let userInfo = UserInfo(email: self.email, name: self.name, nickName: self.nickName, password: self.password)
        
        // 클로저를 통해 RegisterVC(컨트롤러)의 데이터를 전송.
        self.userInfo?(userInfo)
    }
    
    
    // MARK: - Helpers
    // Text Field와 Action을 연결하는 함수.
    func setupTextField() {
        // 코드의 불필요한 중복을 없애기 위해 연산 프로퍼티와 forEach문을 사용하여 처리.
        textFields.forEach {
            tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 버튼에 속성을 설정하는 함수.
    func setupAttribute() {
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
    
    // 사용자가 입력한 회원정보를 확인하고 Valid하면 -> UI 업데이트 (가입 버튼 색 변경)
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickName && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {    // 애니메이션을 추가.
                self.signupButton.backgroundColor = .facebookColor
            }
        } else {
            self.signupButton.isEnabled = false     // 버튼의 클릭이 불가능하게.
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButtonColor
            }
        }
    }
}


// 정규 표현식
extension String {
    // @를 포함하고 2글자 이상일 때 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)   // 여기서 self는 해당 String을 말한다.
    }
    
    // 대문자, 소문자, 특수문자를 포함하고 숫자가 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)  // 여기서 self는 해당 String을 말한다.
    }
}
