//
//  ViewController.swift
//  CalculateGame
//
//  Created by 송재민 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController, SendData {

    func send(cn: Int){
        self.completeCountLabel.text = String(cn)
        self.completedNum = cn
    }
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var difficultyView: UIView!
    
    @IBOutlet weak var finishedView: UIView!
    
    @IBOutlet weak var pv: UIPickerView!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    
    var pickerList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    var questionNum = 1
    var difficulty = 2 //기본 난이도 값
    var completedNum: Int = 0
    @IBOutlet weak var completeCountLabel: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let difficultyValue = sender.value
        
        if(difficultyValue<20){
            difficultyLabel.text = "🙂 매우 쉬움"
            exampleLabel.text = "3 + 4 = ?"
            difficulty = 0
        }
        else if(difficultyValue<40){
            difficultyLabel.text = "😎 쉬움"
            exampleLabel.text = "14 + 2 = ?"
            difficulty = 1
        }
        else if(difficultyValue<60){
            difficultyLabel.text = "🙂 보통"
            exampleLabel.text = "23 + 17 = ?"
            difficulty = 2
        }
        else if(difficultyValue<80){
            difficultyLabel.text = "🙁 어려움"
            exampleLabel.text = "43 + 23 + 34 = ?"
            difficulty = 3
        }
        else{
            difficultyLabel.text = "😱 매우 어려움"
            exampleLabel.text = "(72X6) + 32 = ?"
            difficulty = 4
        }

        
    }
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        guard let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as? GameVC else {return}
        gameVC.delegate = self
        gameVC.questionNum = self.questionNum
        gameVC.difficulty = self.difficulty
        gameVC.completedNum = self.completedNum
        gameVC.modalTransitionStyle = .coverVertical
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*radius, 그림자 주기*/
        startBtn.layer.cornerRadius = 15
        difficultyView.layer.cornerRadius = 8
        pv.layer.cornerRadius = 8
        finishedView.layer.cornerRadius = 8
        
        difficultyView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        difficultyView.layer.shadowOpacity = 1
        difficultyView.layer.shadowRadius = 4
        difficultyView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        pv.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        pv.layer.shadowOpacity = 1
        pv.layer.shadowRadius = 4
        pv.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        finishedView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        finishedView.layer.shadowOpacity = 1
        finishedView.layer.shadowRadius = 4
        finishedView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        self.completeCountLabel.text = String(completedNum)
        
        pv.delegate = self
        pv.dataSource = self
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView:UIPickerView)->Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return pickerList.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        questionNum = Int(pickerList[row]) ?? 0 + 1
     }

}
