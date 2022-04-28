//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/04/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var orLine1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.masksToBounds = false
        loginBtn.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginBtn.layer.shadowRadius = 5
        loginBtn.layer.shadowOpacity = 0.3
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? "" //값이 없는 경우 공백을 넣겠다
        self.loginBtn.backgroundColor = text.isValidEmail() ? #colorLiteral(red: 0.2551737428, green: 0.5762303472, blue: 0.9353198409, alpha: 1) : #colorLiteral(red: 0.778111279, green: 0.8696789742, blue: 0.9796730876, alpha: 1)
        self.email = text
    }
    
    @IBAction func pwTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginBtn.backgroundColor = text.count > 2 ? #colorLiteral(red: 0.2551737428, green: 0.5762303472, blue: 0.9353198409, alpha: 1) : #colorLiteral(red: 0.778111279, green: 0.8696789742, blue: 0.9796730876, alpha: 1)
        
        self.password = text
    }
    
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        //회원가입 정보 전달받아서, 그것과 textField 데이터 일치하면 로그인 가능
        guard let userInfo = self.userInfo else {
            return
        }
        if userInfo.email == self.email && userInfo.password == self.password{
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else{
            
        }
    }
    
    

    @IBAction func registerBtnTapped(_ sender: UIButton) {
        //화면 전환
        //1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //3. 화면전환 메소드
        //self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
        registerViewController.userInfo = {(userInfo) in
            self.userInfo = userInfo
        }
        
    }
    
}
