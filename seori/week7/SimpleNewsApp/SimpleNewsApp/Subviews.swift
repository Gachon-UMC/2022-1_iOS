//
//  Subviews.swift
//  SimpleNewsApp
//
//  Created by 서은수 on 2022/04/30.
//

import Foundation
import UIKit

class Subviews {
    
    static let ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
}
