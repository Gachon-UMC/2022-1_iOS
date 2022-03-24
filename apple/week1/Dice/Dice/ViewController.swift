//
//  ViewController.swift
//  Dice
//
//  Created by 조동진 on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var diceImageView1: UIImageView!
  @IBOutlet weak var diceImageView2: UIImageView!
  @IBOutlet weak var rollButton: UIButton!
  
  var target = 0
  var dice1 = 0
  var dice2 = 0
  
  let diceImage = [
    UIImage(named: "DiceOne"),
    UIImage(named: "DiceTwo"),
    UIImage(named: "DiceThree"),
    UIImage(named: "DiceFour"),
    UIImage(named: "DiceFive"),
    UIImage(named: "DiceSix")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "GreenBackground")!)
    
    rollButton.layer.cornerRadius = 10
    
    // Add UIImageView Gesture
    let dice1TapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.dice1Tapped))
    diceImageView1.isUserInteractionEnabled = true
    diceImageView1.addGestureRecognizer(dice1TapGesture)
    let dice2TapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.dice2Tapped))
    diceImageView2.isUserInteractionEnabled = true
    diceImageView2.addGestureRecognizer(dice2TapGesture)
  }
  
  @objc
  func dice1Tapped(sender: UITapGestureRecognizer) {
    let dice = Int.random(in: 1...6)
    
    diceImageView1.image = diceImage[dice - 1]
    
    if dice + dice2 == target {
      self.presentAlert()
    }
  }
  
  @objc
  func dice2Tapped(sender: UITapGestureRecognizer) {
    let dice = Int.random(in: 1...6)
    
    diceImageView2.image = diceImage[dice - 1]
    
    if dice + dice1 == target {
      self.presentAlert()
    }
  }

  @IBAction func tapRollButton(_ sender: UIButton) {
    dice1 = Int.random(in: 1...6)
    dice2 = Int.random(in: 1...6)
    target = Int.random(in: 2...12)
    
    titleLabel.text = String(target)
    diceImageView1.image = diceImage[dice1 - 1]
    diceImageView2.image = diceImage[dice2 - 1]
    
    if dice1 + dice2 == target {
      self.presentAlert()
    }
  }
  
  func presentAlert() {
    let correctAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
    let alertController = UIAlertController(title: "Correct!", message: "Great Job", preferredStyle: .alert)
    alertController.addAction(correctAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
}

