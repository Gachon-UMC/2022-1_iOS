//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rand1: Int = 0 , rand2: Int = 0 // random number for each dice
    var randAns: Int = 0 // random answer number
    @IBOutlet weak var dice1View: UIImageView!
    @IBOutlet weak var dice2View: UIImageView!
    @IBOutlet weak var randNumLabel: UILabel!
    
    
    
    let diceArr = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func rollBtnClickListener(_ sender: Any) {
        rand1 = Int.random(in: 0...5)
        rand2 = Int.random(in: 0...5)
        randAns = Int.random(in: 2...12)
        dice1View.image = diceArr[rand1]
        dice2View.image = diceArr[rand2]
        randNumLabel.text = String(randAns)
        
        if((rand1+1)+(rand2+1) == Int(randAns)){let alert = UIAlertController(title: "Correct!", message: "Great Job", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Confirm", style: .default) { [self] action in
                self.randNumLabel.text = "Start Game"
                self.dice1View.image = diceArr[0]
                self.dice2View.image = diceArr[0]
              })
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

