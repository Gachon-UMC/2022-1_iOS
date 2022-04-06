import UIKit

class ViewController: UIViewController {
   
    var list = ["1", "2", "3", "4"]
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
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
    let sectionTitle = DifficultySection().sectionTitle
    let emojiLabel = DifficultySection().emojiLabel
    let calculateExpressionLabel = DifficultySection().calculateExpressionLabel
    let slider = DifficultySection().slider
    let diffitcultySideIndicator = DifficultySection().diffitcultySideIndicator
    
    /* Round Section Container */
    
    lazy var roundSectionTitle = RoundSection().roundSectionTitle
    lazy var roundContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightDark")
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true

//        view.addSubview(roundWheePicker)
        

        return view
    }()
    
    lazy var roundWheePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isUserInteractionEnabled = true
        //        isUserInteractionEnabled
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    

    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor(named: "dark")
        view.addSubview(contentView)

        /* UI Component Setting Method*/
        setContentView()
        setNaviation()
        setDifficultySection()
        setRoundSection()
    }
    
    
    func setRoundSection() {
        /* Section Title*/
        roundSectionTitle.topAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: 30).isActive = true
        roundSectionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        roundSectionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
 
        
        /* Round Section Container */
        roundContainer.topAnchor.constraint(equalTo: roundSectionTitle.bottomAnchor, constant: 20).isActive = true
        roundContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        roundContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        roundContainer.heightAnchor.constraint(equalToConstant: 218).isActive = true
        
        
        /* Wheel Picker */
        roundWheePicker.topAnchor.constraint(equalTo: roundContainer.topAnchor, constant: 0).isActive = true
        roundWheePicker.leftAnchor.constraint(equalTo: roundContainer.leftAnchor, constant: 0).isActive = true
        roundWheePicker.rightAnchor.constraint(equalTo: roundContainer.rightAnchor, constant: 0).isActive = true
        roundWheePicker.bottomAnchor.constraint(equalTo: roundContainer.bottomAnchor, constant: 0).isActive = true
    }
    

    
    func setContentView() {
        contentView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 30).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        contentView.addSubview(sectionTitle)
        contentView.addSubview(difficultyContainer)
        contentView.addSubview(roundSectionTitle)
        contentView.addSubview(roundContainer)

        view.addSubview(slider)
        view.addSubview(roundWheePicker)

        
    }
    
    
    func setDifficultySection() {
        /* Stack View Layout */
        difficultyContainer.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 20).isActive = true
        difficultyContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        difficultyContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        difficultyContainer.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        /* Emoji Label */
        emojiLabel.topAnchor.constraint(equalTo: difficultyContainer.topAnchor, constant: 34).isActive = true
        emojiLabel.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 0).isActive = true
        emojiLabel.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: 0).isActive = true
        
        /* MathExpression Label */
        calculateExpressionLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 4).isActive = true
        calculateExpressionLabel.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 0).isActive = true
        calculateExpressionLabel.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: 0).isActive = true
        
        /* Slider */
        slider.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 30).isActive = true
        slider.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 20).isActive = true
        slider.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: -20).isActive = true
        
        /* Range Side Calculator */
        diffitcultySideIndicator.bottomAnchor.constraint(equalTo: difficultyContainer.bottomAnchor, constant: -10).isActive = true
        diffitcultySideIndicator.leftAnchor.constraint(equalTo: difficultyContainer.leftAnchor, constant: 20).isActive = true
        diffitcultySideIndicator.rightAnchor.constraint(equalTo: difficultyContainer.rightAnchor, constant: -20).isActive = true
    
    }
    
    
    func setNaviation() {
        self.title = "설정"
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes // Title Color
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: startButton)]
    }
    
    /* Intent */
    
    @objc func onChangeValueSlider(sender: UISlider){
        sender.setValue(sender.value.rounded(.down), animated: true)
    }
    
    @objc func tapStartButton() {
        print("START BUTTON CLIKED")
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
      }
}


