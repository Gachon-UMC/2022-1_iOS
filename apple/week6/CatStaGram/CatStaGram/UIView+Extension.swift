//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/03/27.
//

import UIKit

extension UIView {
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
