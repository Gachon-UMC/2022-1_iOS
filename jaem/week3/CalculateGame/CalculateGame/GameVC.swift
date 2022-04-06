//
//  GameVC.swift
//  CalculateGame
//
//  Created by 송재민 on 2022/04/07.
//

import UIKit

class GameVC: UIViewController{
    var questionNum: Int = 1
    var difficulty: Int = 2
    var completedNum: Int = 0
    
    var currentQuestion: Int = 0
    
    var question: String = ""
    var answer: Int = 0
    var op1: Int = 0
    var op2: Int = 0
    var op3: Int = 0
    
    var delegate : SendData?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var questionNumIndicator: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var answerView: UIView!
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    private func newQuestion(){
        
        if(difficulty == 0){
            op1 = Int.random(in: 1...9)
            op2 = Int.random(in: 1...9)
            question = String(op1) + "+" + String(op2)
            answer = op1 + op2
            questionLabel.text = question
        }
        else if(difficulty == 1){
            op1 = Int.random(in: 1...99)
            op2 = Int.random(in: 1...9)
            question = String(op1) + "+" + String(op2)
            answer = op1 + op2
            questionLabel.text = question
        }
        else if(difficulty == 2){
            op1 = Int.random(in: 1...99)
            op2 = Int.random(in: 1...99)
            question = String(op1) + "+" + String(op2)
            answer = op1 + op2
            questionLabel.text = question
        }
        else if(difficulty == 3){
            op1 = Int.random(in: 1...99)
            op2 = Int.random(in: 1...99)
            op3 = Int.random(in: 1...99)
            question = String(op1) + "+" + String(op2) + "+" + String(op3)
            answer = op1 + op2 + op3
            questionLabel.text = question
        }
        else{
            op1 = Int.random(in: 1...99)
            op2 = Int.random(in: 1...9)
            op3 = Int.random(in: 1...99)
            question = "(" + String(op1) + "X" + String(op2) + ")" + " + " + String(op3)
            answer = (op1*op2) + op3
            questionLabel.text = question
        }
    
        questionNumIndicator.text = String(currentQuestion+1) + "/" + String(questionNum)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answerField.delegate = self
        
        answerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        answerView.layer.shadowOpacity = 1
        answerView.layer.shadowRadius = 4
        answerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        answerView.layer.cornerRadius = 8
        questionNumIndicator.clipsToBounds = true
        questionNumIndicator.layer.cornerRadius = 15
        questionNumIndicator.text = String(currentQuestion) + "/" + String(questionNum)
        newQuestion()
    }
}

extension GameVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == self.answerField){
        if(answerField.text == String(answer)){
            currentQuestion += 1
            newQuestion()
            answerField.text = ""
            if(currentQuestion == questionNum){
                let alert = UIAlertController(title: "성공", message: "", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.delegate?.send(cn: self.completedNum + 1)
                    
                    self.presentingViewController?.dismiss(animated: true)
                }
                
                alert.addAction(okAction)
                present(alert, animated: false, completion: nil)
            }
        }
        else{
            answerField.text = ""
        }
        
        }
        return true
    }
}
