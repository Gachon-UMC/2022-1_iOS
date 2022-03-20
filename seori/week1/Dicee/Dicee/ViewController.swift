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
        
        let randomNum = Int.random(in: 2...12)
        mainLabel.text = String(randomNum)

        
        var diceName = imageName.randomElement()
        leftDice.image = UIImage(named: diceName!)

        diceName = imageName.randomElement()
        rightDice.image = UIImage(named: diceName!)
    }
}

