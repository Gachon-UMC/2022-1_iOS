import UIKit
import SwiftUI

class ViewController: UIViewController, ReceiveDataDelegate {

    var completedRoundNum: Int = 0
    var difficultyLevel: Int = 2
    var gameRound: Int = 3
    let list = (1...20).map { "\($0)" }

    
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    
    lazy var startButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 52, height: 32))
        btn.setTitle("시작", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.backgroundColor = UIColor(named: "lightDark")
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)
        
        return btn
    }()
    

      
    /* Difficluty Section Container */
    lazy var difficultyContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emojiLabel)
        view.addSubview(calculateExpressionLabel)
        view.addSubview(diffitcultySideIndicator)
        return view
    }()
    let difficultySectionTitle = DifficultySection().sectionTitle
    let emojiLabel = DifficultySection().emojiLabel
    let calculateExpressionLabel = DifficultySection().calculateExpressionLabel
    lazy var slider: UISlider = {
        let slider = UISlider()
   
        slider.minimumValue = 0
        slider.maximumValue = 4
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .white
        slider.isContinuous = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: UIControl.Event.valueChanged)

        return slider
    }()
    let diffitcultySideIndicator = DifficultySection().diffitcultySideIndicator
    
    /* Round Section Container */
    
    lazy var roundSectionTitle = RoundSection().roundSectionTitle
    lazy var roundContainer = RoundSection().roundContainer
    lazy var roundWheePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isUserInteractionEnabled = true
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    /* Done Round Section*/
    lazy var completedRoundSectionTitle = DoneRoundSection().doneRoundSectionTitle
    lazy var completedRoundLabel = DoneRoundSection().doneRoundLabel
    lazy var completedRoundContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(completedRoundLabel)
        
        return view
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCompletedRound()
        emojiLabel.text = GameModel().levelIndicator[difficultyLevel].emoji
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor(named: "dark")
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

    
        /* UI Autolayout Setting Method*/
        setScrollView()
        setContentView()
        setNavigation()
        setDifficultySection()
        setRoundSection()
        setCompletedRoundSection()
    
    }
    
    func setCompletedRoundSection() {
        /* Section Title */
        completedRoundSectionTitle.topAnchor.constraint(equalTo: roundContainer.bottomAnchor, constant: 42).isActive = true
        completedRoundSectionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        completedRoundSectionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        /* Done Round Section Container */
        completedRoundContainer.topAnchor.constraint(equalTo: completedRoundSectionTitle.bottomAnchor, constant: 14).isActive = true
        completedRoundContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        completedRoundContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        completedRoundContainer.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        /* Done Label */
        completedRoundLabel.topAnchor.constraint(equalTo: completedRoundContainer.topAnchor, constant: 21).isActive = true
        completedRoundLabel.rightAnchor.constraint(equalTo: completedRoundContainer.rightAnchor,constant: 0).isActive = true
        completedRoundLabel.leftAnchor.constraint(equalTo: completedRoundContainer.leftAnchor, constant: 0).isActive = true

    }
    
    
    func setRoundSection() {
        /* Section Title*/
        roundSectionTitle.topAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: 30).isActive = true
        roundSectionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        roundSectionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
 
        /* Round Section Container */
        roundContainer.topAnchor.constraint(equalTo: roundSectionTitle.bottomAnchor, constant: 20).isActive = true
        roundContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        roundContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        roundContainer.heightAnchor.constraint(equalToConstant: 218).isActive = true
          
        /* Wheel Picker */
        roundWheePicker.topAnchor.constraint(equalTo: roundContainer.topAnchor, constant: 0).isActive = true
        roundWheePicker.leftAnchor.constraint(equalTo: roundContainer.leftAnchor, constant: 0).isActive = true
        roundWheePicker.rightAnchor.constraint(equalTo: roundContainer.rightAnchor, constant: 0).isActive = true
        roundWheePicker.bottomAnchor.constraint(equalTo: roundContainer.bottomAnchor, constant: 0).isActive = true
        roundWheePicker.selectRow(gameRound, inComponent: 0, animated: false)
    }
    

    func setScrollView() {
        let layout = view.safeAreaLayoutGuide
         scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
         scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
         scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
         scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
    }
    
    
    func setContentView() {
        contentView.addSubview(difficultySectionTitle)
        contentView.addSubview(difficultyContainer)
        contentView.addSubview(roundSectionTitle)
        contentView.addSubview(roundContainer)
        contentView.addSubview(completedRoundSectionTitle)
        contentView.addSubview(completedRoundContainer)
        contentView.addSubview(slider)
        contentView.addSubview(roundWheePicker)
        
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    
    func setDifficultySection() {
        /* Stack View Layout */
        difficultySectionTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        difficultySectionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        difficultySectionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        /* Section Container */
        difficultyContainer.topAnchor.constraint(equalTo: difficultySectionTitle.bottomAnchor, constant: 20).isActive = true
        difficultyContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        difficultyContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        difficultyContainer.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        /* Emoji Label */
        emojiLabel.topAnchor.constraint(equalTo: difficultyContainer.topAnchor, constant: 34).isActive = true
        emojiLabel.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 0).isActive = true
        emojiLabel.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: 0).isActive = true
    
        
        /* MathExpression Label */
        calculateExpressionLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 4).isActive = true
        calculateExpressionLabel.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 0).isActive = true
        calculateExpressionLabel.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: 0).isActive = true
        calculateExpressionLabel.text = GameModel().levelIndicator[difficultyLevel].example
        
        /* Slider */
        slider.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 30).isActive = true
        slider.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 20).isActive = true
        slider.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: -20).isActive = true
        slider.setValue(Float(difficultyLevel), animated: true)

        
        /* Range Side Calculator */
        diffitcultySideIndicator.bottomAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: -10).isActive = true
        diffitcultySideIndicator.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 20).isActive = true
        diffitcultySideIndicator.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: -20).isActive = true
    }
    
  
    
    func setNavigation() {
        self.title = "설정"
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes // Title Color
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: startButton)]
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "dark")

  
    }
    
    /* MARK: Intents */
    @objc func onChangeValueSlider(sender: UISlider){
        let selectedValue = sender.value.rounded(.down) // 1 2 3 4
        let levelIndicator = GameModel().levelIndicator[Int(selectedValue)]
        sender.setValue(selectedValue, animated: true)
        difficultyLevel = Int(selectedValue)
        emojiLabel.text = levelIndicator.emoji
        calculateExpressionLabel.text = levelIndicator.example


    }
    
    @objc func tapStartButton() {
        let vc = GameViewController()
        print(difficultyLevel)
        vc.vm = Math(totalRound: gameRound + 1, level: difficultyLevel)
        vc.compeletedRound = completedRoundNum
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 이전 ViewController에서 받은 값들을 Tableview에 업데이트
    func receiveChildData(_ child: UIViewController, data: Int) {
        completedRoundNum = data
        completedRoundLabel.text = String(data)
        saveCompletedRound()
    }
    
    // Local Database save & load Intents
    func saveCompletedRound() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(completedRoundNum, forKey: "round")
    }
    
    func loadCompletedRound() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.string(forKey: "round") else { return }
        completedRoundNum = Int(data)!
        completedRoundLabel.text = data
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return list.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return list[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          print("select=\(row)")
          gameRound = row
      }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: list[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}



protocol ReceiveDataDelegate: AnyObject {
    func receiveChildData(_ child: UIViewController, data: Int)
}
