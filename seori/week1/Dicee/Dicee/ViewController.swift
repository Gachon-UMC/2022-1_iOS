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
    
    let diceDic = [1:"DiceOne", 2:"DiceTwo", 3:"DiceThree", 4:"DiceFour", 5:"DiceFive", 6:"DiceSix"]
    var randomNum = 0, diceSum = 0
    var dice: Dictionary<Int, String>.Element?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view 모서리를 둥글게 만든다.
        rollButton.layer.cornerRadius = 10
    }


    // Roll 버튼 눌렀을 때 실행되는 액션.
    @IBAction func switchTapped(_ sender: Any) {
        // 랜덤 숫자 label로 출력.
        randomNum = Int.random(in: 2...12)
        mainLabel.text = String(randomNum)
        
        diceSum = 0
        
        // 주사위 이미지 6개의 이름과 값이 담긴 diceDic에서 랜덤으로 하나 가져오는 것.
        dice = diceDic.randomElement()
        leftDice.image = UIImage(named: dice!.value) // 그 dice의 value 이미지로 변경.
        diceSum += dice!.key  // dice 숫자 합 계산.
        
        dice = diceDic.randomElement()
        rightDice.image = UIImage(named: dice!.value) // 그 dice의 value 이미지로 변경.
        diceSum += dice!.key  // dice 숫자 합 계산.
        
        // main label의 값과 두 주사위의 합이 같은지 확인.
        checkEqual()
    }
    
    // 값이 같을 때 alert 띄우는 함수.
    func checkEqual() {
        if (randomNum == diceSum) {
            let alert = UIAlertController(title: "Correct!", message: "Greate Job", preferredStyle: .alert)
            
            // alert 뜨고 confirm 클릭했을 때 실행할 코드.
            let alertAction = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
                leftDice.image = UIImage(named: diceDic[1]!)
                rightDice.image = UIImage(named: diceDic[1]!)
                mainLabel.text = "Start Game"
            }
            
            alert.addAction(alertAction)
            present(alert, animated: false, completion: nil)
        }
    }
}

