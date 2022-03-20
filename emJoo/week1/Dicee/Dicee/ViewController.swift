/* Anchor & NSLayout을 이용하여 인터페이스 구현 */

import UIKit

class ViewController: UIViewController {
    
    /* Interface (Subviews) */
    
    lazy var logo = SubView().logo
    lazy var mainLabel = SubView().mainLabel
    lazy var dice1 = SubView().dice1
    lazy var dice2 = SubView().dice2
    lazy var buttonStackView = SubView().buttonStackView
    lazy var rollButton = SubView().rollButton
    
    

    
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

