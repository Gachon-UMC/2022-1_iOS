//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
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
        
        setAttributesToButton()
        setupTextField()
        
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
            
        case nameTextField:
            self.isValidName = text.count > 2
        
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
        
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 이전화면으로 돌아가기 (뒤로가기)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Helpers
    // 버튼에 속성(글자마다 색을 다르게)을 주는 함수.
    func setAttributesToButton() {
        // 버튼 안의 텍스트의 폰트 사이즈 설정.
        let fontSize = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        
        // 버튼의 titleLable을 NSMutableAttributedString으로 바꿔서 attributedStr에 저장한다.
        // & 폰트 사이즈 속성 추가.
        let attributedStr = NSMutableAttributedString(string: (bottomButton.titleLabel?.text)!, attributes: fontSize)

        // text중 계정이 있으신가요? 에 해당하는 곳에 Light Gray 색을 준다.
        attributedStr.addAttribute(.foregroundColor, value: UIColor.lightGray, range: ((bottomButton.titleLabel?.text)! as NSString).range(of: "계정이 있으신가요?"))

        // text중 '로그인'에 해당하는 곳에 facebookColor를 준다.
        attributedStr.addAttribute(.foregroundColor, value: UIColor.init(named: "facebookColor")!, range: ((bottomButton.titleLabel?.text)! as NSString).range(of: "로그인"))
        
        // 속성을 버튼에 적용시킨다.
        bottomButton.setAttributedTitle(attributedStr, for: .normal)
    }
    
    // Text Field와 Action을 연결하는 함수.
    func setupTextField() {
        // 코드의 불필요한 중복을 없애기 위해 연산 프로퍼티와 forEach문을 사용하여 처리.
        textFields.forEach {
            tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 Valid하면 -> UI 업데이트 (가입 버튼 색 변경)
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickName && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {    // 애니메이션을 추가.
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else {
            self.signupButton.isEnabled = false     // 버튼의 클릭이 불가능하게.
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.disabledButtonColor
            }
        }
    }
}


// 정규 표현식
extension String {
    // @를 포함하고 2글자 이상일 때 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = " [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
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
