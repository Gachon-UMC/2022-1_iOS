import UIKit

class GameViewController: UIViewController {
    
    var difficultyLevel: Int = 0
    var gameRound: Int = 0
    var vm: Math = Math(totalRound: 0, level: 0)
 

    
    lazy var backArrowButton: UIBarButtonItem = {
        let barBtnItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(routeBack))
        barBtnItem.tintColor = .white
        return barBtnItem
    }()
    
    lazy var roundIndicator: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 52, height: 32))
        btn.backgroundColor = UIColor(named: "lightDark")
        btn.setTitle("1/4", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.backgroundColor = UIColor(named: "lightDark")
        btn.layer.cornerRadius = 16
        
        return btn
    }()
    
    lazy var mathProblemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
   
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var answerContainer: UITextField = {
                
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "lightDark")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return textField
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavgationUISetting()
        view.addSubview(mathProblemLabel)
        view.addSubview(answerContainer)
        mathProblemLabel.text = vm.setMathProblemLabel()
        print("LEVEL \(vm.level)")
        print("TOATL ROUND \(vm.totalRound)")

//        view.addSubview(answerTextField)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        /* MathPrombelm Label */
        mathProblemLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 120).isActive = true
        mathProblemLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        mathProblemLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        /* MathPrombelm textfield */
        answerContainer.topAnchor.constraint(equalTo: mathProblemLabel.bottomAnchor, constant: 82).isActive = true
        answerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerContainer.widthAnchor.constraint(equalToConstant: 153).isActive = true
        answerContainer.heightAnchor.constraint(equalToConstant: 84).isActive = true
        

        
    }
    
    
    /* UI Initial Settings */
    func setNavgationUISetting() {
        self.view.backgroundColor = UIColor(named: "dark")
        self.navigationItem.leftBarButtonItem = backArrowButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: roundIndicator)
        
    }
    
  
    
    @objc func routeBack() {
        _ = navigationController?.popToRootViewController(animated: true) // 이전 View Controller로 이동

    }
    
}

