import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
   
    var difficultyLevel: Int = 2
    var gameRound: Int = 3
    let list = (1...20).map { "\($0)" }

    
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height * 2)
        return scroll
    }()
    
//    lazy var contentView: UIView = {
//        let view = UIView()
//        view.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
    
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
    let sectionTitle = DifficultySection().sectionTitle
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
    lazy var doneRoundSectionTitle = DoneRoundSection().doneRoundSectionTitle
    lazy var doneRoundLabel = DoneRoundSection().doneRoundLabel
    lazy var doneRoundContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(doneRoundLabel)
        
        return view
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor(named: "dark")
     
        view.addSubview(scrollView)
        let layout = view.safeAreaLayoutGuide
         scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
         scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
         scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
         scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
    
        /* UI Component Setting Method*/
        setContentView()
        setNavigation()
        setDifficultySection()
        setRoundSection()
        setDoneRoundSection()
    }
    
    func setDoneRoundSection() {
        /* Section Title */
        doneRoundSectionTitle.topAnchor.constraint(equalTo: roundContainer.bottomAnchor, constant: 42).isActive = true
        
        /* Done Round Section Container */
        doneRoundContainer.topAnchor.constraint(equalTo: doneRoundSectionTitle.bottomAnchor, constant: 14).isActive = true
        doneRoundContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        doneRoundContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        doneRoundContainer.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        /* Done Label */
        doneRoundLabel.topAnchor.constraint(equalTo: doneRoundContainer.topAnchor, constant: 21).isActive = true
        doneRoundLabel.rightAnchor.constraint(equalTo: doneRoundContainer.rightAnchor,constant: 0).isActive = true
        doneRoundLabel.leftAnchor.constraint(equalTo: doneRoundContainer.leftAnchor, constant: 0).isActive = true

    }
    
    
    func setRoundSection() {
        /* Section Title*/
        roundSectionTitle.topAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: 30).isActive = true
        roundSectionTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        roundSectionTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
 
        
        /* Round Section Container */
        roundContainer.topAnchor.constraint(equalTo: roundSectionTitle.bottomAnchor, constant: 20).isActive = true
        roundContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        roundContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        roundContainer.heightAnchor.constraint(equalToConstant: 218).isActive = true
        
        
        /* Wheel Picker */
        roundWheePicker.topAnchor.constraint(equalTo: roundContainer.topAnchor, constant: 0).isActive = true
        roundWheePicker.leftAnchor.constraint(equalTo: roundContainer.leftAnchor, constant: 0).isActive = true
        roundWheePicker.rightAnchor.constraint(equalTo: roundContainer.rightAnchor, constant: 0).isActive = true
        roundWheePicker.bottomAnchor.constraint(equalTo: roundContainer.bottomAnchor, constant: 0).isActive = true
        roundWheePicker.selectRow(gameRound, inComponent: 0, animated: false)
    }
    

    
    func setContentView() {
//        contentView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 30).isActive = true
//        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        contentView.addSubview(sectionTitle)
//        contentView.addSubview(difficultyContainer)
//        contentView.addSubview(roundSectionTitle)
//        contentView.addSubview(roundContainer)
//        contentView.addSubview(doneRoundSectionTitle)
//        contentView.addSubview(doneRoundContainer)
        
        view.addSubview(sectionTitle)
        view.addSubview(difficultyContainer)
        view.addSubview(roundSectionTitle)
        view.addSubview(roundContainer)
        view.addSubview(doneRoundSectionTitle)
        view.addSubview(doneRoundContainer)


        view.addSubview(slider)
        view.addSubview(roundWheePicker)
        
        

        
    }
    
    
    func setDifficultySection() {
        /* Stack View Layout */

        
        sectionTitle.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 30).isActive = true
        
        difficultyContainer.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 20).isActive = true
        difficultyContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        difficultyContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        difficultyContainer.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        /* Emoji Label */
        emojiLabel.topAnchor.constraint(equalTo: difficultyContainer.topAnchor, constant: 34).isActive = true
        emojiLabel.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 0).isActive = true
        emojiLabel.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: 0).isActive = true
        emojiLabel.text = GameModel().levelIndicator[difficultyLevel].emoji
        
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
    }
    
    /* Intent */
    @objc func onChangeValueSlider(sender: UISlider){
        let selectedValue = sender.value.rounded(.down)
        let levelIndicator = GameModel().levelIndicator[Int(selectedValue)]
        sender.setValue(selectedValue, animated: true)
        difficultyLevel = Int(selectedValue)
        emojiLabel.text = levelIndicator.emoji
        calculateExpressionLabel.text = levelIndicator.example


    }
    
    @objc func tapStartButton() {
        print("START BUTTON CLIKED")
        let vc = GameViewController()
//        vc.difficultyLevel = difficultyLevel
//        vc.gameRound = gameRound
        vc.vm = Math(totalRound: gameRound, level: difficultyLevel)
        self.navigationController?.pushViewController(vc, animated: true)
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


