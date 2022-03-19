//
//  ViewController.swift
//  Dicee
//
//  Created by 이해주 on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {
    
    
    /*  Commit TEST !!!!! */
    lazy var randomNumLabel: UILabel = {
        let label = UILabel()
        label.text = "Start Game" // initial String value
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

