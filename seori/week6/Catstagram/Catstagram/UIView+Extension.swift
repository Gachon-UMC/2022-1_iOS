//
//  UIView+extension.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/02.
//

import UIKit

// UIView의 기능 확장.
extension UIView {
    // 모서리를 둥글게!
    // @IBInspectable -> 해당 변수를 IB의 인스펙터로 사용할 수 있다는 뜻.
    // 인스펙터에 cornerRadius 항목이 추가됨.
    @IBInspectable var cornerRadius: CGFloat {
        // get과 set으로 연산 프로퍼티를 정의한 것.
        // 값을 가져올 때.
        get {
            return layer.cornerRadius
        }
        // 값을 세팅할 때.
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
