//
//  DoneRoundSection.swift
//  MathGame
//
//  Created by 이해주 on 2022/04/07.
//

import UIKit

class DoneRoundSection {
    lazy var doneRoundSectionTitle: UIView = {
        let label = UILabel()
        label.text = "게임 완료 횟수"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var doneRoundContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(doneRoundLabel)
        
        return view
    }()
    
    lazy var doneRoundLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
}
