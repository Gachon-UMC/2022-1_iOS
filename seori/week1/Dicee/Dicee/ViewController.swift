//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func switchTapped(_ sender: Any) {
        let imageName = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        // 랜덤 숫자 label로 출력.
        let randomNum = Int.random(in: 2...12)
        mainLabel.text = String(randomNum)
        
        // 주사위 이미지 6개의 이름이 담긴 imageName 배열에서 랜덤으로 하나 가져오는 것.
        var diceName = imageName.randomElement()
        leftDice.image = UIImage(named: diceName!) // 그 이미지로 변경.

        diceName = imageName.randomElement()
        rightDice.image = UIImage(named: diceName!) // 그 이미지로 변경.
    }
}

