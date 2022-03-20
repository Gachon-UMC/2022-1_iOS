/* Anchor & NSLayout을 이용하여 인터페이스 구현 */

import UIKit

class ViewController: UIViewController {
    
    /* Interface (Subviews) */
    
    lazy var logo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "DiceeLogo")

        return img
    }()
    
    lazy var mainLabel: UILabel = {
       let label = UILabel()
        label.text = "Start Game"
        label.textColor = .white
        label.font = label.font.withSize(50)
        
        
        return label
    }()
    
    
    lazy var dice1: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "DiceOne")
        
        let btn = UIButton(configuration: config, primaryAction: nil)
        
        return btn
    }()
    
    lazy var dice2: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "DiceOne")
        
        let btn = UIButton(configuration: config, primaryAction: nil)
        
        return btn
    }()
    
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dice1, dice2])
        stackView.axis = .horizontal
        stackView.spacing = 28
        
        return stackView
    }()
    
    lazy var rollButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .red
        config.buttonSize = .large
        config.title = "Roll"
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 28, bottom: 10, trailing: 28)

        
        let btn = UIButton(configuration: config, primaryAction: nil)
        
        return btn
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Layer Background Image (백그라운드 이미지)
        view.layer.contents = #imageLiteral(resourceName: "GreenBackground").cgImage
        
        
        // Add Subviews (서브 연동)
        view.addSubview(logo)
        view.addSubview(mainLabel)
        view.addSubview(buttonStackView)
        view.addSubview(rollButton)
        
        
        
        // Resizeing Make 적용
        logo.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Constraints (constant값 제약 조건)
        logo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        mainLabel.topAnchor.constraint(equalTo: logo.layoutMarginsGuide.bottomAnchor, constant: 42).isActive = true
        rollButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: rollButton.layoutMarginsGuide.topAnchor, constant: -82).isActive = true
        
        
    
        // Align Contrains with NS (Align 레이아웃 설정)
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
}

