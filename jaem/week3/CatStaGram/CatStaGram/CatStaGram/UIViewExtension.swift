//
//  UIViewExtension.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/04/02.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
