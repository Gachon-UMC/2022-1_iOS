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
        let diceDic = [1:"DiceOne", 2:"DiceTwo", 3:"DiceThree", 4:"DiceFour", 5:"DiceFive", 6:"DiceSix"]
        
        // 랜덤 숫자 label로 출력.
        let randomNum = Int.random(in: 2...12)
        mainLabel.text = String(randomNum)
        
        var diceSum = 0
        // 주사위 이미지 6개의 이름과 값이 담긴 diceDic에서 랜덤으로 하나 가져오는 것.
        var dice = diceDic.randomElement()
        
        leftDice.image = UIImage(named: dice!.value) // 그 dice의 value 이미지로 변경.
        diceSum += dice!.key  // dice 숫자 합 계산.
        
        dice = diceDic.randomElement()
        rightDice.image = UIImage(named: dice!.value) // 그 dice의 value 이미지로 변경.
        diceSum += dice!.key  // dice 숫자 합 계산.
        
        // 값이 같을 때 alert 띄우기.
        if (randomNum == diceSum) {
            let alert = UIAlertController(title: "Correct!", message: "Greate Job", preferredStyle: .alert)
            
            // alert 뜨고 confirm 클릭했을 때 실행할 코드.
            let alertAction = UIAlertAction(title: "Confirm", style: .default) { _ in
                self.leftDice.image = UIImage(named: diceDic[1]!)
                self.rightDice.image = UIImage(named: diceDic[1]!)
                self.mainLabel.text = "Start Game"
            }
            
            alert.addAction(alertAction)
            present(alert, animated: false, completion: nil)
        }
    }
}

