//
//  GameViewController.swift
//  MemorizeGame
//
//  Created by 조동진 on 2022/05/26.
//

// Scene에 처음 진입하면 3초간 모든 카드 보여주기 (flipAllCard의 호출 시점이 문제? main thread에서 countDown이랑 겹치나?)

import UIKit
typealias User = UserViewModel.User

class GameViewController: UIViewController {
  // MARK: Variables
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var countDownLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var quitButton: UIButton!
  @IBOutlet weak var cardCollectionView: UICollectionView!
  
  var userViewModel = UserViewModel()
  var card: Card?
  var firstSelectedCell: GameCollectionViewCell?
  var firstSelectedCardText: String?
  var countDown = 3
  var countDownTimer: DispatchSourceTimer?
  var currentSeconds = 0
  var currentSecondsTimer: DispatchSourceTimer?
  var correctNum = 0
  var life = 5
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    categoryLabelConfig()
    layerConfig()
    collectionviewConfig()
    startCountDown()
  }
  
  // MARK: Actions
  private func startCountDown() {
    cardCollectionView.allowsSelection = false
    countDownLabel.text = String(countDown)
    countDownTimer = DispatchSource.makeTimerSource(flags: [], queue: .main)
    countDownTimer?.schedule(deadline: .now() + 1, repeating: 1)
    countDownTimer?.setEventHandler(handler: { [weak self] in
      guard let self = self else { return }
      let cells = self.cardCollectionView.visibleCells as! [GameCollectionViewCell]
      if self.countDown == 3 {
        for cell in cells {
          cell.flip()
        }
      }
      
      self.countDown -= 1
      self.countDownLabel.text = String(self.countDown)

      if self.countDown == 0 {
        self.countDownLabel.text = "Start!"
        self.countDownTimer?.cancel()
        self.startTimer()
        
        for cell in cells {
          cell.flip()
        }
      }
    })
    countDownTimer?.resume()
  }
  
  private func startTimer() {
    cardCollectionView.allowsSelection = true
    currentSecondsTimer = DispatchSource.makeTimerSource(flags: [], queue: .main)
    currentSecondsTimer?.schedule(deadline: .now(), repeating: 1)
    currentSecondsTimer?.setEventHandler(handler: { [weak self] in
      guard let self = self else { return }
      self.currentSeconds += 1
      self.timeLabel.text = self.currentSecondsFormatting(currentSeconds: self.currentSeconds)
      
      if self.currentSeconds >= 3600 {
        self.currentSecondsTimer?.cancel()
        self.timeOut()
      }
    })
    currentSecondsTimer?.resume()
  }
  
  private func categoryLabelConfig() {
    categoryLabel.text = card?.category ?? "Category"
  }
  
  private func layerConfig() {
    timeLabel.clipsToBounds = true
    timeLabel.layer.cornerRadius = 10
    quitButton.layer.cornerRadius = 20
  }
  
  private func collectionviewConfig() {
    cardCollectionView.dataSource = self
    cardCollectionView.delegate = self
    cardCollectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GameCollectionViewCell")
    
    cardCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  }
  
  @IBAction func tapQuit(_ sender: UIButton) {
    guard let homeViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else { return }
    self.view.window?.windowScene?.keyWindow?.rootViewController = homeViewController
  }
  
  func clearGame() {
    currentSecondsTimer?.cancel()
    let alert = UIAlertController(title: "congratulation!", message: "You cleared the game\n" + currentSecondsFormatting(currentSeconds: currentSeconds), preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
      guard let content = alert.textFields?[0].text else { return }
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "YYYY.MM.dd"
      let user = User(name: content, date: dateFormatter.string(from: Date()), clearTime: self!.currentSecondsFormatting(currentSeconds: self!.currentSeconds))
      self?.userViewModel.addUser(user: user)
      
      guard let homeViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else { return }
      self?.view.window?.windowScene?.keyWindow?.rootViewController = homeViewController
    })
    alert.addAction(okAction)
    alert.addTextField(configurationHandler: {textFiend in
      textFiend.placeholder = "Input your name"
    })
    
    self.present(alert, animated: true)
  }
  
  func failGame() {
    let alert = UIAlertController(title: "Try again!", message: "You didn't clear the game", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
      guard let homeViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else { return }
      self.view.window?.windowScene?.keyWindow?.rootViewController = homeViewController
    })
    alert.addAction(okAction)
    
    self.present(alert, animated: true)
  }
  
  func timeOut() {
    let alert = UIAlertController(title: "Time Out!", message: "The time is up. Try again", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
      guard let homeViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else { return }
      
      self.view.window?.windowScene?.keyWindow?.rootViewController = homeViewController
    })
    alert.addAction(okAction)
    
    self.present(alert, animated: true)
  }
  
  func currentSecondsFormatting(currentSeconds: Int) -> String {
    let minutes = (currentSeconds % 3600) / 60 // 현재 분
    let seconds = (currentSeconds % 3600) % 60 // 현재 초
    
    return String(format: "%02d:%02d", minutes, seconds)
  }
}

// MARK: UICollectionView
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as? GameCollectionViewCell else { return UICollectionViewCell() }
    
    cell.emojiLabel.text = card?.emogis[indexPath.row]
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let side = CGFloat((cardCollectionView.frame.width / 3) - 14) // 124
    return CGSize(width: side, height: 140)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell else { return }
    
    if cell.isCorrect == false {
      if firstSelectedCardText == nil { // 선택한 카드가 첫 번째 카드인 경우
        firstSelectedCardText = cell.emojiLabel.text
        firstSelectedCell = cell
        cell.flip()
      } else { // 두 번째 카드인 경우
        if firstSelectedCell == cell { return }
        if firstSelectedCardText == cell.emojiLabel.text { // 맞았을 경우
          firstSelectedCell?.isCorrect = true
          cell.flip()
          cell.isCorrect = true
          firstSelectedCardText = nil
          correctNum += 1
          
          if correctNum == 6 { // 게임 클리어
            clearGame()
          }
        } else { // 틀렸을 경우
          cell.flip()
          self.cardCollectionView.allowsSelection = false
          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.firstSelectedCell?.flip()
            cell.flip()
            self.cardCollectionView.allowsSelection = true
          }
          firstSelectedCardText = nil
          life -= 1
          
          if life == 0 {
            failGame()
          }
        }
      }
    }
  }
  
}
