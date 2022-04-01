//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var bottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

}
