//
//  RegisterViewController.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/04/02.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet{
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupBtn: UIButton!
    //Textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var textFields: [UITextField]{
        [emailTextField, nameTextField, nicknameTextField, pwTextField]
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    //MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender{
        case emailTextField:
            self.isValidEmail = text.count>5
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case pwTextField:
            self.isValidPassword = text.count>5
            self.password = text
        default:
            fatalError("Missing TF")
        }
    }
    
    @IBAction func backBtnTapped(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    //MARK: - Helpers
    private func setUpTextField(){
        textFields.forEach{tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    //사용자가 입력한 회원정보를 확인하고 ui 업데이트
    private func validateUserInfo(){
        
        if isValidName && isValidEmail && isValidNickname && isValidPassword{
            UIView.animate(withDuration: 0.33) {
                self.signupBtn.isEnabled = true
                self.signupBtn.backgroundColor = #colorLiteral(red: 0.2551737428, green: 0.5762303472, blue: 0.9353198409, alpha: 1)
            }
            
        }else{
            UIView.animate(withDuration: 0.33){
                self.signupBtn.isEnabled = false
                self.signupBtn.backgroundColor = #colorLiteral(red: 0.778111279, green: 0.8696789742, blue: 0.9796730876, alpha: 1)
            }
        }
    }

}

//정규표현식
extension String{
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
