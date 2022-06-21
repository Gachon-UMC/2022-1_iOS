//
//  GameVC.swift
//  MemorizeGame
//
//  Created by 송재민 on 2022/06/05.
//

import UIKit

class GameVC: UIViewController{
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var quitBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*게임 시작 카운트다운 카운터*/
    var countTimer : Timer?
    var countTimerNum : Int = 0
    var gameStart : Bool = false
    
    /*게임 완료 시간 카운터*/
    var timer : Timer?
    var timerNum : Int = 0
    
    var gameVM = GameVM()
    var rankVM = RankVM()
    typealias Rank = RankVM.Rank

    var firstFlippedCardIndex: IndexPath?
    var matchedCard = 0
    
    var cardDataSource: [String] = []
    
    //var ranks: [Rank] = UserDefaults.standard.value(forKey: "ranks") as! [Rank]
    
    /*quit 버튼 눌렀을 때*/
    @IBAction func quitBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*타이머 함수*/
    func startTimer(){
        if timer != nil && timer!.isValid{
            timer!.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback(){
        timerNum += 1
        
        let minute = timerNum % 3600 / 60
        let second = timerNum % 3600 % 60
        
        var minuteText = ""
        var secondText = ""
        
        if(minute < 10){
            minuteText = "0" + String(minute)
        }else{
            minuteText = String(minute)
        }
        
        if(second < 10){
            secondText = "0" + String(second)
        }else{
            secondText = String(second)
        }
        
        timeLabel.text = minuteText + ":" + secondText
    }
    
    func startCountDown(){
        if countTimer != nil && countTimer!.isValid{
            countTimer!.invalidate()
        }
        
        countTimerNum = 3
        
        countTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showCountDown), userInfo: nil, repeats: true)
    }
                                
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameVM.setCardList(cards: cardDataSource)
        
        startCountDown()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /*ui 구성*/
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 5
        timeLabel.layer.isHidden = true
        
        quitBtn.layer.masksToBounds = true
        quitBtn.layer.cornerRadius = 10
    }
    
    
}


extension GameVC: UICollectionViewDelegate{
    
    @objc func showCountDown(){

        countDownLabel.text = String(countTimerNum)
        
        if(countTimerNum == 0){
            countTimer?.invalidate()
            countTimer = nil
            
            gameStart = true
            collectionView.reloadData()
            
            countDownLabel.layer.isHidden = true
            
            startTimer()
            timeLabel.layer.isHidden = false
            
        }
        
        countTimerNum -= 1

    }
    
    // MARK: 게임 로직
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell else {fatalError()}
        
        
        if((gameVM.getCardList()[indexPath.row].isFlipped == false) &&
           (gameVM.getCardList()[indexPath.row].isMatched == false)) {
            
            cell.flipUp()
            
            if firstFlippedCardIndex == nil{
                firstFlippedCardIndex = indexPath
            } else{
                checkForMatch(indexPath)
            }
        }
        
    }
    
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath){
        
        var cardOne = gameVM.getCardList()[firstFlippedCardIndex!.row]
        var cardTwo = gameVM.getCardList()[secondFlippedCardIndex.row]
        
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? GameCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? GameCollectionViewCell
        
        if cardOne.cardPicture == cardTwo.cardPicture{
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.showFront()
            cardTwoCell?.showFront()
            
            self.matchedCard += 1
            
            if(self.matchedCard == 6){
                winGame()
            }
        } else{
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        self.firstFlippedCardIndex = nil
    }
    
    func winGame(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let current_date_string = formatter.string(from: Date())
        
        let alert = UIAlertController(title: "Succeed", message: timeLabel.text, preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "Leave name"
        }
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: { okAction in
            let myName = alert.textFields?[0].text
            self.rankVM.addRank(newRank: Rank(name: myName!, date: current_date_string, clearTime: self.timeLabel.text!))
            
            //self.ranks.append(Rank(name: myName!, date: current_date_string, clearTime: self.timeLabel.text!))
            //UserDefaults.standard.setValue(Rank(name: myName!, date: current_date_string, clearTime: self.timeLabel.text!), forKey: "ranks")
            
            self.dismiss(animated: true, completion: nil)
            
        })
        
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }
}

extension GameVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as? GameCollectionViewCell else{fatalError()}
        cell.picLabel.text = cardDataSource[indexPath.row]
        //cell.backgroundColor = .blue
        cell.layer.cornerRadius = 10
        
        if(!gameStart){
            cell.flipUp()
        }else{
            cell.flipDown()
        }
        
        return cell
    }
}

extension GameVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 10, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(13)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(12)
    }
}
