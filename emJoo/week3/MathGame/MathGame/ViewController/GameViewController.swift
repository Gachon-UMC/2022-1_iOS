import UIKit

class GameViewController: UIViewController {
    
    var difficultyLevel: Int = 0
    var gameRound: Int = 0

    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavgationUISetting()
    }
    
    
    
    
    /* UI Initial Settings */
    func setNavgationUISetting() {
        self.view.backgroundColor = UIColor(named: "dark")
        self.navigationItem.leftBarButtonItem = backArrowButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: roundIndicator)
        
        roundIndicator.setTitle("1/\(gameRound + 1)", for: .normal)
    }
    
    
    
    @objc func routeBack() {
        _ = navigationController?.popToRootViewController(animated: true) // 이전 View Controller로 이동

    }
    
}
