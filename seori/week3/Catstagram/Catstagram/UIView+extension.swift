//
//  UIView+extension.swift
//  Catstagram
//
//  Created by 서은수 on 2022/04/02.
//

import UIKit

extension UIView {
    // 모서리를 둥글게!
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
